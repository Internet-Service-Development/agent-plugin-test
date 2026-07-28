---
name: handoff-sync-out
description:
  Write this agent's handoff files back to the per-issue handoff branch, safely,
  from an isolated git worktree so nothing leaks into the feature branch's PR.
  Fetches latest first, writes only the paths this agent OWNS (no whole-folder
  overwrite → no clobber), commits atomically, and pushes with a non-fast-forward
  retry loop. Call whenever an agent needs to persist handoff/session state.
---

# Handoff Sync-Out Skill

Persist this agent's handoff/session files to the handoff branch. Runs in an isolated worktree, writes only the paths this agent owns. Paired with `handoff-sync-in`.

## Ownership

An agent writes **only its own paths**, never the whole folder.

> WHY: committing the whole folder from a possibly-stale runner copy reverts other agents' newer files (clobber). Per-file commits can't.

- Default owned: `docs/${AGENT_NAME}.json`, `session/${AGENT_NAME}.json` (name-keyed).
- Extra owned via `HANDOFF_OWNED_EXTRA` (e.g. data-gathering owns `screenshots/`).
- An owned path that is **absent from the runner working tree** (`SRC = $GITHUB_WORKSPACE/.claude/handoff`) is **deleted** on the branch. This is the only delete mechanism — it's how planning drops its `session/planning.json` on completion (delete the local file, then run this). Ownership scoping means only OWNED paths are ever considered — another agent's files (e.g. `docs/data-gathering.json`) are never touched, even if absent locally.

## Preconditions

Runner env: `ISSUE_NUMBER` (builds the branch name). git must be able to `fetch`/`push origin` — `actions/checkout` persists this by default; the workflow needs `contents: write`. This skill does **not** read `GH_TOKEN`/`GH_REPO`.

Passed by the invoking agent **on the command line** (see Run):

- `AGENT_NAME` — **required**; selects owned paths.
- `HANDOFF_OWNED_EXTRA` — optional; extra owned paths.

> WHY on the command line, not `GITHUB_ENV`: the agent is chosen _inside_ the running Claude step, so `GITHUB_ENV` (which only affects _later_ workflow steps) can't carry it; and the Bash tool doesn't persist shell state between calls. An env prefix on the same invocation runs in the same process, so the script sees it. The value comes from the agent's own frontmatter `name`.

The agent must have already updated its files under the runner working tree `SRC` (= `$GITHUB_WORKSPACE/.claude/handoff`, populated by sync-in) before running this.

## Run

The logic lives in [`sync-out.sh`](./scripts/sync-out.sh). Invoke it **from the repo root** with `AGENT_NAME` (and `HANDOFF_OWNED_EXTRA` if you own extra paths) as an env prefix on the same command line:

```bash
# Use YOUR agent's own name (from your agent's .md / frontmatter `name`).
# <your-agent-name> is a placeholder — replace it; the lines below are examples, not literal values.
AGENT_NAME=<your-agent-name> bash ${CLAUDE_PLUGIN_ROOT}/skills/handoff-sync-out/scripts/sync-out.sh

# examples:
#   planning        →  AGENT_NAME=planning bash ${CLAUDE_PLUGIN_ROOT}/skills/handoff-sync-out/scripts/sync-out.sh
#   data-gathering  →  AGENT_NAME=data-gathering HANDOFF_OWNED_EXTRA=screenshots bash ${CLAUDE_PLUGIN_ROOT}/skills/handoff-sync-out/scripts/sync-out.sh
```

What it does (see the script for exact commands):

1. Fetch the branch tip.
2. Set up an isolated worktree in `$RUNNER_TEMP` — track the existing branch, or bootstrap an empty orphan (`--no-checkout` + `switch --orphan`, so no feature files land in the handoff commit).
3. `apply_owned` — mirror OWNED paths from the runner working tree (`SRC`) into the worktree: present → copy, absent → delete on the branch.
4. `stage_owned` — stage **only** OWNED paths; commit (`[skip ci]`); push with a non-fast-forward retry (reset onto the new tip + re-apply — others' files come from the tip, so no conflict, no clobber).
5. An `EXIT` trap removes the worktree on any exit.

## Rules

- Only touch owned paths — the script iterates `OWNED` only, never the whole folder.
- The worktree is removed on any exit via an `EXIT` trap (success, failure, or `set -e` abort).
- Human-facing surfaces (plan document, `@claude` triggers/answers, completion notes) stay as issue comments — this skill is for machine handoff/session state only.
