# handoff-sync-in — flow

Read-only pull of `.claude/handoff/` from the handoff branch into the runner's working tree. Never commits, never touches the git index. Full contract: [SKILL.md](./SKILL.md).

```mermaid
flowchart TD
  A([sync-in start]) --> B["BRANCH = ${ISSUE_NUMBER}-agent-session-handoff"]
  B --> C{"git fetch origin BRANCH"}
  C -- "branch absent" --> E["first agent — empty handoff"]
  C -- "ok" --> D{"git archive .claude/handoff → tar -x<br/>into working tree, NOT the index"}
  D -- "no .claude/handoff on branch yet" --> E
  D -- "extracted" --> F["handoff now local under .claude/handoff/"]
  E --> G["mkdir skeleton: docs/ session/ screenshots/"]
  F --> G
  G --> H["report what landed"]
  H --> I([done — agent Reads the docs/* it needs])

  classDef term fill:#eef1f6,stroke:#94a3b8,color:#5f6b7d;
  classDef dec fill:#e9f1fd,stroke:#2f6fd6,color:#1c2634;
  classDef proc fill:#f5f7fa,stroke:#cbd5e3,color:#1c2634;
  class A,I term;
  class C,D dec;
  class B,E,F,G,H proc;
```

**Key point:** extraction uses `git archive` (streams to disk), not `git checkout <branch> -- path` — so nothing is staged and handoff files can never leak into the feature branch's PR (they are also gitignored in the repo).
