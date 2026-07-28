---
name: handoff-sync-in
description:
  Pull the shared agent-handoff folder (.claude/handoff/) from the per-issue
  handoff branch into the current feature-branch working tree so the agent can
  read it as local files. Read-only fetch — never commits, never touches the
  git index. .claude/handoff/ is gitignored in the repo, so it can never leak
  into the feature branch's PR. Call at the START of any agent that consumes handoff data.
---

# Handoff Sync-In Skill

Pull the handoff folder from the handoff branch into the **runner working tree** so the agent reads it as local files. Read-only — never commits or stages. Paired with `handoff-sync-out`.

## Model

```
Durable store = branch  ${ISSUE_NUMBER}-agent-session-handoff   (per issue)
  .claude/handoff/
    docs/{AGENT_NAME}.json     ← each agent's handoff output (the contract)
    session/{AGENT_NAME}.json  ← per-agent pause/resume state
    screenshots/               ← binary, produced by data-gathering
```

## Preconditions

- `ISSUE_NUMBER` (runner env) — the **only** env var this skill reads; builds the branch name. (data-gathering: resolve it **after** the mirror issue is created.)
- git must be able to `fetch origin` — `actions/checkout` persists this credential by default.

## Run

The logic lives in [`sync-in.sh`](./scripts/sync-in.sh). From the repo root:

```bash
bash ${CLAUDE_PLUGIN_ROOT}/skills/handoff-sync-in/scripts/sync-in.sh
```

What it does (see the script for exact commands):

1. Check the branch on the remote (`git ls-remote`): genuinely absent → first agent (empty handoff); can't reach origin → **abort** (do not fake an empty handoff — that would misroute a resuming agent into a false fresh start). If present, fetch it.
2. Extract `.claude/handoff/` into the runner working tree via `git archive` (streams to disk — **no index, no commit**). It does **not** use `git checkout <branch> -- path`, which would stage the files.
3. Ensure the `docs/` `session/` `screenshots/` skeleton exists so readers can glob safely.
4. Report what landed.

## After sync-in — reading the handoff

- Handoff is **multiple files** under `docs/` in the runner working tree — one per upstream agent, each a standalone per-phase handoff. Read the ones your task needs (your agent's own .md says which — usually the upstream phase(s) you build on). The `agent-handoff-schema` skill (`Skill` tool → `agent-handoff-schema:agent-handoff-schema`) documents each file's shape.
- Your own resume state (if any) is `session/{AGENT_NAME}.json`.
- Screenshots referenced by handoff JSON live under `screenshots/`.

## Rules

- Never `git add` / `commit` / `push` here — read-only. Writing back is `handoff-sync-out`'s job.
- Re-run at the start of every run: the runner is wiped between runs, so the branch is the only source of truth.
