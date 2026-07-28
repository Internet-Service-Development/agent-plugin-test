# handoff-sync-out — flow

Write this agent's owned handoff/session files back to the handoff branch, from an isolated worktree, with a non-fast-forward retry loop. Full contract: [SKILL.md](./SKILL.md).

```mermaid
flowchart TD
  A([sync-out start]) --> B["agent sets AGENT_NAME<br/>+ HANDOFF_OWNED_EXTRA if it owns extra paths"]
  B --> C["OWNED = docs/&lt;AGENT&gt;.json, session/&lt;AGENT&gt;.json + extras"]
  C --> D{"git fetch origin BRANCH<br/>branch exists?"}
  D -- "yes" --> E["worktree add ← origin/BRANCH<br/>isolated, in RUNNER_TEMP"]
  D -- "no" --> F["bootstrap empty orphan branch<br/>--no-checkout + switch --orphan"]
  E --> G["apply_owned: mirror OWNED into worktree<br/>present → copy · absent → delete"]
  F --> G
  G --> H["stage_owned: stage OWNED paths only"]
  H --> I{"anything staged?"}
  I -- "no" --> Z([done])
  I -- "yes" --> J["commit + [skip ci]"]
  J --> K{"git push origin BRANCH"}
  K -- "ok" --> Z
  K -- "rejected — non-fast-forward" --> L["fetch · reset --hard origin/BRANCH · apply_owned · stage_owned<br/>others' files come from new tip → no conflict"]
  L --> M{"retried 5x?"}
  M -- "no → retry" --> I
  M -- "yes" --> X([FAIL · exit 1])

  classDef term fill:#eef1f6,stroke:#94a3b8,color:#5f6b7d;
  classDef dec fill:#e9f1fd,stroke:#2f6fd6,color:#1c2634;
  classDef proc fill:#f5f7fa,stroke:#cbd5e3,color:#1c2634;
  classDef bad fill:#fdecec,stroke:#d64545,color:#1c2634;
  class A,Z term;
  class C,D,I,K,M dec;
  class B,E,F,G,H,J,L proc;
  class X bad;
```

**Invariants the diagram encodes:**

- **Isolation** — all commit/push happens in a worktree under `RUNNER_TEMP`, never in the feature checkout → nothing leaks into the code PR.
- **Ownership** — only `OWNED` paths are touched (`apply_owned` + `stage_owned`); on non-fast-forward the reset + re-apply takes others' files from the new tip, so the retry never hits a merge conflict and never clobbers another agent.
- **Cleanup** — the worktree is removed on any exit (success, failure, or `set -e` abort) via an `EXIT` trap.
