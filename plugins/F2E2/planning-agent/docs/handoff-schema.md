# Handoff Schema (reference)

Field-semantics reference for the planning pipeline. Read on demand — do not inline into agent prompts.

The **envelope** (`app_name` + `feature_name` + `payload{ phase, context_pack, body }`) is the shell template exposed by the `agent-handoff-schema` skill (`Skill` tool → `agent-handoff-schema:agent-handoff-schema`) — the single structural authority; it defines each phase's `payload.body` fields + their semantics.

- **INPUT** — the `data-gathering` body; read by `planning.md` at Handoff Validation and by `handoff-validation.md` (validation subagent).
- **OUTPUT** — the `planning` body; written by `planning.md` at Finalization (into the shell template) and read by the downstream coding agent as its input.

`app_name` / `feature_name` are set by the first agent and agree across files. Schema documents **known fields only** — inspect the actual JSON and use whatever is present.

> Branch layout, ownership, and read/write mechanics live in the `handoff-sync-in` / `handoff-sync-out` skills — not here.

## INPUT — `data-gathering` body

The `payload.body` of `.claude/handoff/docs/data-gathering.json`, wrapped in the shell template's envelope:

```json
{
  "issue": {
    "jira": {
      "key": "<string>",
      "url": "<string>",
      "type": "<string>",
      "priority": "<string | null>",
      "status": "<string>",
      "components": ["<string>"],
      "assignee": "<string>",
      "parent": "<string — may be absent>",
      "websiteSystem": "<string — may be absent>",
      "summary": "<string>",
      "description": "<string — verbatim raw Jira description; often thin with no explicit Requirements/Acceptance Criteria>"
    },
    "github": {
      "repo": "<owner/repo>",
      "number": "<number>",
      "url": "<string>",
      "state": "<string>",
      "assignee": {
        "login": "<string — GitHub username; agent tags this human by default>",
        "name": "<string | null — display name if resolved>"
      },
      "note": "<string | omitted — records skip/pre-existing caveats and whether synthesised Acceptance Criteria is authoritative>",
      "title": "<string>",
      "labels": [
        {
          "name": "<string>",
          "whyMatched": "<string>"
        }
      ],
      "difficulty": {
        "level": "<1–5>",
        "axes": {
          "scope": "<1–5>",
          "clarity": "<1–5>",
          "logic": "<1–5>",
          "unknowns": "<1–5>"
        },
        "signals": ["<string>"]
      },
      "references": [
        {
          "type": "jira | figma | confluence",
          "title": "<string>",
          "url": "<string>"
        }
      ],
      "description": "<string — self-contained structured spec in named sections (## 來源 Jira, ## 參考文件, ## Scaffolder 必填欄位, ## 功能目的, ## 整體流程, ## 詳細規格(FSD), ## API 規格, ## 驗收清單, ## 開發約束); the ## 驗收清單 [Fn] checklist is the Acceptance-Criteria-of-record unless note says otherwise>"
    }
  },
  "figmaData": [
    {
      "figmaUrl": "<string>",
      "classification": "UI | UX",
      "data": {
        "__comment": "Shape varies by classification (see Notes). All fields optional except baseline for UI.",
        "components": [
          {
            "name": "<string>",
            "role": "container|text|button|input|icon|image",
            "children": ["<string>"]
          }
        ],
        "codeConnect": [
          {
            "nodeId": "<string>",
            "component": "<string>",
            "filePath": "<string>",
            "propMap": {}
          }
        ],
        "props": {
          "<propName>": "<type | enum: a|b>"
        },
        "colors": [
          {
            "token": "<string>",
            "usage": "bg|text|border|accent"
          }
        ],
        "layout": "<direction; gap; alignment; responsive notes>",
        "variants": [
          {
            "<group>": ["<option>"]
          }
        ],
        "baseline": [
          {
            "label": "<string>",
            "node-id": "<string>",
            "frame": "<string>",
            "tokens": {
              "bg": "",
              "text": "",
              "border": "",
              "radius": "",
              "padding": "",
              "font": ""
            }
          }
        ],
        "motion": [
          {
            "trigger": "<string>",
            "duration": "<string>",
            "easing": "<string>",
            "properties": ["<string>"]
          }
        ],
        "steps": [
          {
            "label": "<string>",
            "detail": "<string>"
          }
        ],
        "transitions": [
          {
            "from": "<string>",
            "to": "<string>",
            "trigger": "<string>"
          }
        ],
        "branches": [
          {
            "at": "<string>",
            "condition": "<string>",
            "target": "<string>"
          }
        ],
        "entry": "<string>",
        "exit": "<string>"
      },
      "unresolved": ["<reason if any>"]
    }
  ],
  "confluenceData": [
    {
      "page": {
        "id": "<string>",
        "title": "<string>",
        "space": "<string>",
        "url": "<string>",
        "lastUpdated": "<date>",
        "version": "<string>"
      },
      "docType": "prd | api | fsd | other",
      "summary": "<string>",
      "spec": {
        "description": "<string>",
        "requirements": [
          {
            "rule": "<string>",
            "source": "<string>",
            "status": "<string>",
            "phase": "<string>"
          }
        ],
        "acceptance": ["<string>"],
        "constraints": [
          {
            "rule": "<string>",
            "source": "<string>"
          }
        ],
        "backlog": ["<string>"]
      },
      "apis": [
        {
          "name": "<string>",
          "method": "GET|POST|PUT|DELETE|PATCH",
          "path": "<string>",
          "description": "<string>",
          "auth": "<string>",
          "example": "<string>",
          "requestFields": [
            {
              "name": "<string>",
              "in": "path|query|header|body",
              "type": "<string>",
              "required": "<bool>",
              "allowNull": "<bool>",
              "defaultValue": null,
              "description": "<string>"
            }
          ],
          "responseFields": [
            {
              "name": "<string>",
              "type": "<string>",
              "allowNull": "<bool>",
              "defaultValue": null,
              "description": "<string>",
              "ref": "<string | omitted>"
            }
          ],
          "errors": [
            {
              "code": "<string>",
              "message": "<string>",
              "description": "<string>"
            }
          ]
        }
      ],
      "dataModels": [
        {
          "name": "<string>",
          "description": "<string>",
          "fields": [
            {
              "name": "<string>",
              "type": "<string>",
              "allowNull": "<bool>",
              "defaultValue": null,
              "description": "<string>"
            }
          ]
        }
      ],
      "environments": [
        {
          "name": "<string>",
          "baseUrl": "<string>",
          "healthUrl": "<string>",
          "docsUrl": "<string>"
        }
      ],
      "externalRefs": [
        {
          "type": "<string>",
          "url": "<string>",
          "note": "<string>"
        }
      ],
      "childPages": [
        {
          "id": "<string>",
          "title": "<string>",
          "url": "<string>"
        }
      ],
      "tables": [
        {
          "title": "<string>",
          "columns": ["<string>"],
          "rowMeaning": "<string>",
          "source": "<string>"
        }
      ],
      "images": [
        {
          "title": "<string>",
          "ref": "<string>",
          "kind": "flow|diagram|screenshot|other"
        }
      ],
      "sections": [
        {
          "heading": "<string>",
          "level": "<number>"
        }
      ],
      "revisionHistory": [
        {
          "version": "<string>",
          "date": "<date>",
          "author": "<string>",
          "change": "<string>"
        }
      ],
      "openQuestions": ["<string>"],
      "references": [
        {
          "type": "jira | figma | confluence",
          "title": "<string>",
          "url": "<string>"
        }
      ],
      "unresolved": []
    }
  ],
  "codeBaseData": {
    "referenceDocs": [
      {
        "path": "<string>",
        "offers": "<string>"
      }
    ],
    "existingComponents": [
      {
        "path": "<string>",
        "why": "<string>"
      }
    ],
    "conventions": {},
    "typePatterns": {},
    "buildingBlocks": [],
    "recommendedShape": ["<string>"],
    "integrationPoints": {},
    "unresolved": []
  },
  "unresolved": []
}
```

## Notes

- `issue.jira.description` — verbatim raw Jira; often thin, no explicit Requirements/Acceptance Criteria.
- `issue.github.description` — self-contained structured spec in named sections. The `## 驗收清單` `[Fn]` checklist is the Acceptance-Criteria-of-record; other sections (`功能目的`/`整體流程`/`詳細規格`/`API 規格`) carry the spec detail. NOT authoritative if `issue.github.note` says so — then Acceptance-Criteria-of-record is `confluenceData[].spec.acceptance`. Match sections by heading name; order may vary.
- `issue.github.references` — canonical list of all linked resources (Figma, Confluence, Jira).
- `issue.github.assignee` — the responsible owner. `login` is the GitHub username the planning agent tags by default when it must pause for a human decision (see planning.md **## Pause Protocol > ### Tag targets**); `name` is the display name if resolved.
- `figmaData[].classification`: `"UI"` = component/visual design; `"UX"` = flow/wireframe. UI has `components`, `props`, `colors`, `layout`, `variants`, `baseline`; `codeConnect` + `motion` OPTIONAL. UX has `steps`, `transitions`, `branches`, `entry`, `exit`. Omit fields not applicable. New fields may appear — use whatever present.
- `figmaData[].data.codeConnect[]` maps Figma nodes to codebase components — use to populate `## Codebase Context > Existing components` + inform "Files to modify" in Implementation Plan.
- `confluenceData[].docType` distinguishes PRDs (`prd`), API specs (`api`), FSDs (`fsd`). `apis[]` + `dataModels[]` only for `docType: "api"`. Unknown types = general reference.
- `codeBaseData` maps to `## Codebase Context`. Additional fields may be present — incorporate into relevant plan sections.

## OUTPUT — `planning` body

The `payload.body` of `.claude/handoff/docs/planning.json`. planning fills the shell template's envelope with `phase: "planning"` + its harvested `context_pack`, and this body:

```json
{
  "plan": "<full implementation plan markdown — verbatim same as the ## Planning Document comment>"
}
```

- `plan` is the **main output**: the full implementation plan (markdown). It is the **canonical source** the coding agent reads, and is **verbatim identical** to the `## Planning Document` comment shown to humans — planning writes the plan once to both places, so they cannot drift. On each `adjust` round it regenerates and updates both.
