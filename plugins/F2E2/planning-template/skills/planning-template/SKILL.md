---
name: planning-template
description: >
  Plan document template for the planning agent — defines every `{{...}}` placeholder across
  External References, Handoff Quality, Codebase Context, Routes, API Layer Strategy, Layout
  Section, Features, and Implementation Plan. Load when drafting or filling a planning-agent
  plan file (Design phase / Writing the Plan File step).
---

# Planning Template Skill

Bundled asset: `${CLAUDE_PLUGIN_ROOT}/skills/planning-template/assets/planning-template.md`.

## Use

1. `Read` the asset above.
2. Fill every `{{...}}` placeholder from the current handoff-validation result (see the
   `agent-handoff-schema` skill for the input shape). For `<!-- CONDITIONAL -->` blocks,
   include or remove per the stated condition — e.g. keep `### API Spec` on the `ready` path,
   `### Mock Data Implementation` on the `mock` path, never both.
3. Write the filled result to the plan file. No `{{...}}` placeholder may remain when done.
