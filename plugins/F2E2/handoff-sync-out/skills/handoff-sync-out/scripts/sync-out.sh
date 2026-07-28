#!/usr/bin/env bash
# handoff-sync-out — write this agent's OWNED handoff/session files back to the per-issue
# handoff branch, from an isolated worktree, with a non-fast-forward retry loop. See SKILL.md.
#
# Env (passed by the invoking agent on the command line, e.g.
#   AGENT_NAME=planning bash sync-out.sh
#   AGENT_NAME=data-gathering HANDOFF_OWNED_EXTRA=screenshots bash sync-out.sh):
#   AGENT_NAME           required — selects owned paths (docs/<AGENT_NAME>.json, session/<AGENT_NAME>.json)
#   HANDOFF_OWNED_EXTRA  optional — extra owned paths, space-separated, relative to .claude/handoff/
# Env (from GitHub Actions): ISSUE_NUMBER, GITHUB_WORKSPACE, RUNNER_TEMP.
set -euo pipefail

: "${AGENT_NAME:?set AGENT_NAME on the invocation, e.g. AGENT_NAME=planning bash sync-out.sh}"

BRANCH="${ISSUE_NUMBER:?ISSUE_NUMBER must be in the runner env}-agent-session-handoff"
ROOT="${GITHUB_WORKSPACE//\\//}"       # runner working tree (SRC lives here); normalize Windows backslashes
WT="${RUNNER_TEMP//\\//}/handoff-wt"   # isolated worktree, OUTSIDE the runner working tree → no PR leak
SRC="$ROOT/.claude/handoff"            # the runner working tree copy of the handoff (populated by sync-in)

# Remove the worktree on ANY exit (success, failure, or set -e abort).
trap 'git worktree remove "$WT" --force 2>/dev/null || true' EXIT

OWNED=( "docs/${AGENT_NAME}.json" "session/${AGENT_NAME}.json" )
for extra in ${HANDOFF_OWNED_EXTRA:-}; do OWNED+=( "$extra" ); done

# Mirror each owned path from the runner working tree (SRC) into the worktree:
#   present in SRC  → copy (add/update);  absent in SRC → delete it on the branch.
apply_owned() {
  for p in "${OWNED[@]}"; do
    if [ -e "$SRC/$p" ]; then
      mkdir -p "$(dirname "$WT/.claude/handoff/$p")"
      rm -rf "$WT/.claude/handoff/$p"
      cp -r "$SRC/$p" "$WT/.claude/handoff/$p"
    else
      rm -rf "$WT/.claude/handoff/$p"
    fi
  done
}

# Stage ONLY owned paths (add/update/delete). Skip a path that neither exists nor is tracked,
# so a never-created owned file doesn't make `git add` error out.
stage_owned() {
  for p in "${OWNED[@]}"; do
    wtp=".claude/handoff/$p"
    if [ -e "$WT/$wtp" ] || git -C "$WT" ls-files --error-unmatch -- "$wtp" >/dev/null 2>&1; then
      git -C "$WT" add -A -- "$wtp"
    fi
  done
}

# 1) Fetch latest tip (may not exist yet).
git fetch origin "$BRANCH:refs/remotes/origin/$BRANCH" 2>/dev/null && EXISTS=1 || EXISTS=0

# 2) Worktree: track existing branch, or bootstrap a fresh orphan.
git worktree remove "$WT" --force 2>/dev/null || true
if [ "$EXISTS" = "1" ]; then
  git worktree add "$WT" "origin/$BRANCH" 2>/dev/null
  git -C "$WT" switch -C "$BRANCH" "origin/$BRANCH"
else
  # First writer: empty orphan branch. --no-checkout skips materializing the feature tree
  # (fast, no full copy); switch --orphan then gives a cleared tree + empty index, so no
  # feature files can land in the handoff commit.
  git worktree add --no-checkout --detach "$WT"
  git -C "$WT" switch --orphan "$BRANCH"
fi
git -C "$WT" config user.email "agent@ci.local"
git -C "$WT" config user.name  "cosmos-agent"

# 3) Apply + stage owned paths only.
mkdir -p "$WT/.claude/handoff"
apply_owned
stage_owned

# 4) Nothing changed? done.
if git -C "$WT" diff --cached --quiet; then
  echo "handoff-sync-out: no changes for $AGENT_NAME"; exit 0
fi

# 5) Commit. [skip ci] keeps it out of CI.
git -C "$WT" commit -m "chore(handoff): sync ${AGENT_NAME} [skip ci]"

# 6) Push with non-fast-forward retry: reset onto the new tip and re-apply owned paths
#    (others' files come from the tip, so a per-file re-apply never conflicts).
for attempt in 1 2 3 4 5; do
  if git -C "$WT" push origin "$BRANCH"; then
    echo "handoff-sync-out: pushed $AGENT_NAME (attempt $attempt)"; exit 0
  fi
  git -C "$WT" fetch origin "$BRANCH:refs/remotes/origin/$BRANCH"
  git -C "$WT" reset --hard "origin/$BRANCH"
  apply_owned
  stage_owned
  git -C "$WT" diff --cached --quiet && { echo "handoff-sync-out: converged"; exit 0; }
  git -C "$WT" commit -m "chore(handoff): sync ${AGENT_NAME} [skip ci]"
done

echo "handoff-sync-out: FAILED to push after retries" >&2
exit 1
