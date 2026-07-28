---
name: agent-handoff-schema
description: >
  Shared handoff envelope shell (app_name, feature_name, payload.phase, payload.context_pack,
  payload.body) used by every agent in the handoff pipeline (data-gathering, planning,
  handoff-validation, coding-agent, ...) when writing its own
  `.claude/handoff/docs/{AGENT_NAME}.json`. Load whenever an agent needs to assemble or read a
  handoff file's shape.
---

# Agent Handoff Schema Skill

Bundled asset: `${CLAUDE_PLUGIN_ROOT}/skills/agent-handoff-schema/assets/handoff-schema.json`.

## Shell fields

- `app_name` / `feature_name` — carried across every phase; filled from whichever upstream
  agent first resolved them.
- `payload.phase` — this agent's own name (e.g. `"planning"`, `"data-gathering"`).
- `payload.context_pack[]` — audit trail of non-obvious decisions this agent made. Each entry:
  `name` (`"[agent|subagent]: <AgentName>"`), `task_title`, `decision`, `reason`, optional
  `modified[]` (later corrections: `reason` + `changed_files[]`).
- `payload.body` — this agent's own phase-specific keys. Shape is owned entirely by that
  agent (e.g. planning's `body.plan`, data-gathering's `body.issue` / `body.figmaData` /
  `body.confluenceData` / `body.codeBaseData`).

## Use

`Read` the bundled asset as the starting shell, fill `app_name` / `feature_name` /
`payload.phase` / `payload.context_pack`, then add whatever `payload.body` keys this agent's
own contract defines. This skill defines only the shell — it has no opinion on `body`'s shape;
each agent's own docs still own that.

> Note: this covers the outer **shell** only. Per-phase field references for what goes inside
> a specific agent's `body` (e.g. planning's own handoff-schema.md) may still live alongside
> that agent for now — a candidate to fold in here later if more agents need the same body
> fields.
