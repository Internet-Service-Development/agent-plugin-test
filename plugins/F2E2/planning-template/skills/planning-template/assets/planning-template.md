# Plan: {{app_name}} / {{feature_name}}

## External References

- Figma: {{figma_url | none}}
- Jira: {{jira_key | none}}
- Confluence: {{confluence_url | none}}
- GitHub: {{github_issue_url | none}}

---

## Handoff Quality

| Source     | Status                                               | Impact                    | Resolution          |
| ---------- | ----------------------------------------------------- | -------------------------- | -------------------- |
| {{source}} | {{✅ complete \| ⚠️ partial — reason \| ❌ blocked}} | {{affected section or —}} | {{resolution or —}} |

---

## Codebase Context

**Existing components to reuse:**
{{existing_components}}

**Conventions:**
{{conventions}}

**Recommended file shape:**
{{recommended_shape}}

**Integration points:**
{{integration_points}}

**Type patterns:**
{{type_patterns}}

**Reference docs consulted:**
{{reference_docs_consulted}}

---

## Routes

| Key     | Path     | Name     |
| ------- | -------- | -------- |
| {{key}} | {{path}} | {{name}} |

---

## API Layer Strategy

| Artefact         | Strategy                   |
| ----------------- | --------------------------- |
| API functions    | {{api_functions_strategy}} |
| Interfaces/types | {{interfaces_strategy}}    |
| Mock data        | {{mock_data_strategy}}     |

<!-- CONDITIONAL: include on the `ready` path (api_readiness is ready, OR real API data present in the handoff) -->

### API Spec

{{api_spec_endpoints}}

<!-- END CONDITIONAL -->

<!-- CONDITIONAL: include on the `mock` path (no API spec by either signal) -->

### Mock Data Implementation

{{mock_data_code_template}}

<!-- END CONDITIONAL -->

---

## Layout Section

### Page structure (top → bottom)

{{page_structure_ordered_list}}

### Component groupings

{{component_groupings}}

### Visual interpretation notes

{{visual_interpretation_notes}}

---

## Features

> Source: issue AC (primary) + figmaData + confluenceData + screenshots. Codebase Context informs implementation only — it must not add or remove features.

- [F1] {{feature_description}}
  - Given: {{precondition_with_concrete_values}}
  - When: {{user_action_with_exact_label}}
  - Then: {{expected_outcome_with_exact_values}}

---

## Implementation Plan

### Files to create

| File          | Purpose     |
| ------------- | ----------- |
| {{file_path}} | {{purpose}} |

### Files to modify

| File          | Change     |
| ------------- | ---------- |
| {{file_path}} | {{change}} |

### Test file

| File               | Purpose     |
| ------------------ | ----------- |
| {{spec_file_path}} | {{purpose}} |

### Step-by-step order

{{numbered_implementation_steps_with_dependencies}}

---

## Post-Implementation Deviations

(To be filled after implementation)
