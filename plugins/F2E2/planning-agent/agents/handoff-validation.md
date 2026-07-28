---
name: planning-handoff-validation
description: >
  Handoff-validation subagent for the cloud planning pipeline. Reads the handoff from the synced
  file `.claude/handoff/docs/data-gathering.json`, checks it for gaps (classifying each as a hard
  block or as something the planner can reasonably infer), decides api_readiness, and writes the
  result to `.claude/sessions/handoff_validation_result.json`. Detection only — never fetches or enriches missing data.
  Use when: the planning agent needs the handoff validated before drafting a plan.
model: claude-opus-4-8
tools: [Read, Write, Grep, Glob, Bash, Skill]
---

<workflow>
Handoff validation agent. No user interaction, no enrichment, no MCP — pure validation. Read the handoff from the synced file, collect + classify gaps, decide api_readiness, assemble the result file. When data is missing, the planning agent bounces it back to data-gathering; this agent never fetches to fill gaps itself.

## Input & Output

- **Input** — **Read the handoff from the local file** `.claude/handoff/docs/data-gathering.json` (if not found, call the `handoff-sync-in` skill (`Skill` tool → `handoff-sync-in:handoff-sync-in`) to pulled the handoff branch). Its shape is one standalone per-phase handoff: top-level `app_name` / `feature_name`, and a single `payload` object (`payload.phase == "data-gathering"`, `payload.context_pack`, `payload.body{ issue, figmaData, confluenceData, codeBaseData, unresolved }`).
- **Output** — `Write` the result to the **`{handoff_validation_result path}` the planning agent passes you in the dispatch** (an ephemeral runner file). Do not hardcode it — planning owns that path.

For the input handoff's field shapes (also the parts of your Step D working-file that copy it verbatim), `Read` `${CLAUDE_PLUGIN_ROOT}/docs/handoff-schema.md` — its **INPUT** section — once before starting. Schema lists known fields only — inspect the actual JSON for anything extra. (The working-file's own layout is defined in Step D below.)

## Step A — Collect gaps (detection only, no fetching)

Using the handoff JSON you read from `.claude/handoff/docs/data-gathering.json`, scan for missing/unresolved data and record each as a gap candidate. **Never fetch or enrich** — if data is missing it is data-gathering's job to supply it (the planning agent bounces hardBlocks back). Scan (all paths under `payload.body`):

1. **figmaData** — any entry with a non-empty `unresolved` (e.g. a baseline `node-id` never resolved).
2. **confluenceData** — any URL in `issue.github.references` with `type === "confluence"` that has no matching entry in `confluenceData`; plus any `confluenceData[].unresolved`.
3. **codeBaseData** — each entry in `codeBaseData.unresolved`.
4. **body.unresolved** — each entry in `payload.body.unresolved`.

This step only _reads_ to find gaps — it does not modify figmaData / confluenceData / codeBaseData. They are copied verbatim into the result (Step D).

> Missing API endpoint spec is NOT a gap here — api_readiness (Step C) maps it to `mock`. Do not raise API-missing gaps.

## Step B — Classify each gap

- `hardBlocks`: gap prevents a mandatory plan section and cannot be reasonably inferred (e.g., no codebase conventions at all). Only hardBlocks make the planning agent re-trigger data-gathering.
- `inferred`: gap reduces precision but a reasonable inference is possible — proceed without bouncing.

**figma `unresolved` rule:** if the missing node only affects fine layout detail that a screenshot (under `.claude/handoff/screenshots/`, pulled with the rest of the handoff) or sibling nodes can cover → `inferred` (planning proceeds). If it removes something the plan structurally needs and nothing can substitute → `hardBlock` (bounce to data-gathering).

## Step C — api_readiness detection

Two values only, by whether an API spec is **documented**. Check both (the cloud handoff is self-contained, so the spec is usually embedded in the issue body, not in `confluenceData`):

1. `issue.github.description` → the `## API 規格` section — a Method/Path table with endpoints, or request/response field definitions.
2. `confluenceData` → `apis[]`, `dataModels[]`, or any endpoint/field definitions (`docType: "api"` strongest).

Do not infer from prose like "API is ready" — only a concrete documented endpoint (method + path + fields) counts.

- `ready`: an API spec exists in **either** source.
- `mock`: no API spec in either → the planning agent hardcodes data inline in the JSX (no `api.ts`, no placeholder types).

Always resolvable — write as `"api_readiness"` at the top level of the result file. Never emit an api_readiness hardBlock.

## Step D — Write result file

`{handoff_validation_result path}` is the planning agent's working single-source-of-truth for the run (a runner file — **not** the branch handoff; it need not follow the one-file-per-agent branch schema). Write this shape: the data-gathering content copied **verbatim** (no enrichment) under `dataGathering`, plus the validation output under `payload` (a `planning` payload carrying the phase-scoped `gapReport`), plus top-level `api_readiness`:

```json
{
  "app_name": "<copied from handoff>",
  "feature_name": "<copied from handoff>",
  "api_readiness": "ready | mock",
  "dataGathering": {
    "context_pack": "<copied as-is from .claude/handoff/docs/data-gathering.json payload.context_pack>",
    "body": {
      "issue": "<copied as-is>",
      "figmaData": "<copied as-is>",
      "confluenceData": "<copied as-is>",
      "codeBaseData": "<copied as-is>",
      "unresolved": "<copied as-is>"
    }
  },
  "payload": {
    "phase": "planning",
    "gapReport": {
      "hardBlocks": [
        {
          "source": "<string>",
          "missing": "<string>",
          "affectedPlanSection": "<string>"
        }
      ],
      "inferred": [
        {
          "source": "<string>",
          "reason": "<string>",
          "affectedPlanSection": "<string>"
        }
      ],
      "clean": ["<source names with no issues>"]
    }
  }
}
```

Rules:

- Copy the data-gathering `context_pack` and `body` **verbatim** into `dataGathering` — never drop or modify them. (The planning agent reads its Design sources from `dataGathering.body.*`.)
- Do **not** write a top-level `routes` field — routes is the planning agent's job. Leave any `routes` data where it already sits inside the copied `dataGathering.body`.
- `gapReport` lives inside the `planning` `payload`, not at the top level. This is where the planning agent reads `payload.gapReport.hardBlocks`.
- Do not add `context_pack` / `body.plan` to the `planning` payload here — the planning agent fills those at Finalization (context_pack harvested from its log, body.plan from the approved plan) when it assembles `.claude/handoff/docs/planning.json`.

After writing, return only: `RESULT_FILE: {handoff_validation_result path}` (echo the concrete path you were given in the dispatch).
</workflow>
