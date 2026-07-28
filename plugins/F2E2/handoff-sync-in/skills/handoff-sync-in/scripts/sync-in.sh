#!/usr/bin/env bash
# handoff-sync-in — pull the handoff folder from the per-issue handoff branch into the
# runner working tree so the agent can read it as local files. Read-only: never commits,
# never touches the git index. See SKILL.md for the contract.
#
# Env (from GitHub Actions): ISSUE_NUMBER (required), GITHUB_WORKSPACE.
set -euo pipefail

BRANCH="${ISSUE_NUMBER:?ISSUE_NUMBER must be in the runner env}-agent-session-handoff"
ROOT="${GITHUB_WORKSPACE//\\//}"   # runner working tree; normalize Windows backslashes → forward slashes

# 1) Does the handoff branch exist on the remote? Distinguish "genuinely absent" (first agent)
#    from "can't reach origin". A transient fetch failure must NOT be mistaken for an empty
#    handoff — that would make a resuming agent falsely start fresh / think there is no handoff.
if git ls-remote --exit-code --heads origin "$BRANCH" >/dev/null 2>&1; then
  BRANCH_EXISTS=1
else
  rc=$?
  if [ "$rc" -eq 2 ]; then
    BRANCH_EXISTS=0            # ls-remote rc=2 → no matching ref → the branch does not exist yet
  else
    echo "handoff-sync-in: ERROR — cannot reach origin to check '$BRANCH' (git ls-remote rc=$rc)." >&2
    echo "handoff-sync-in: aborting instead of faking an empty handoff." >&2
    exit 1
  fi
fi

if [ "$BRANCH_EXISTS" = "1" ]; then
  # 2) Fetch, then extract into the runner working tree via `git archive` (streams to disk —
  #    no index, no commit). WHY not `git checkout <branch> -- path`: that would stage the files.
  #    The fetch runs under set -e (no 2>/dev/null) so a genuine failure here aborts loudly.
  git fetch origin "$BRANCH:refs/remotes/origin/$BRANCH"
  if git archive "origin/$BRANCH" .claude/handoff 2>/dev/null | tar -x -C "$ROOT"; then
    echo "handoff-sync-in: pulled .claude/handoff/ from $BRANCH"
  else
    echo "handoff-sync-in: branch exists but has no .claude/handoff/ yet (empty handoff)"
  fi
else
  echo "handoff-sync-in: branch $BRANCH does not exist yet — first agent, empty handoff"
fi

# 3) Ensure the folder skeleton exists so readers can glob safely.
mkdir -p "$ROOT/.claude/handoff/docs" "$ROOT/.claude/handoff/session" "$ROOT/.claude/handoff/screenshots"

# 4) Report what landed.
echo "--- docs ---";        ls -1 "$ROOT/.claude/handoff/docs"        2>/dev/null || true
echo "--- session ---";     ls -1 "$ROOT/.claude/handoff/session"     2>/dev/null || true
echo "--- screenshots ---"; ls -1 "$ROOT/.claude/handoff/screenshots" 2>/dev/null | wc -l
