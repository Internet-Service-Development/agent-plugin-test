---
name: log-keeper
description:
  Write or update a session log entry under .claude/log/sessions/. Called after
  each agent or subagent ends. Files are organized by issue folder (falls back
  to an `<agentName>/` folder only when no issue ID is known yet — no branch,
  no confirmation needed); one `<agentName>.json` file per top-level agent
  name — the folder alone carries the issue identity, so the same folder +
  agentName always reuses the same file, across sessions — subagents append
  their work into that same file's context_pack instead of creating their own
  file. Before indexing to Elasticsearch, reconciles with any prior ES record
  for the same issue+agent so history survives even if the local file didn't.
---


# Session Log Skill

Record what happened in this work session so future agents and humans have a
traceable audit trail without re-reading the whole conversation.

## File Layout

```
.claude/log/sessions/
  issue-<N>/                                  ← created when GitHub Issue ID is known (priority)
    <agentName>.json                          ← one file per top-level agent name
  <agentName>/                                ← fallback only — used when no issue ID is known yet
    <agentName>.json
```

The filename is always `<agentName>.json` — the folder alone (issue number,
or the agentName itself as a fallback) carries the identity, so it's never
repeated in the filename.

`<agentName>` is the **top-level phase agent** (e.g. `issue-coder`), kebab-cased.
A subagent it spawns does not get its own file — its work is appended as an
additional `context_pack` entry in the same file.

---

## Schema — per-agent file

```JSON
{
    "session": {
        "id": "[GitHub_Issue_ID]-[agentName], or just [agentName] if no issue ID is known yet",
        "github_issue_number": "[N] — set as soon as the GitHub issue exists; omit while unknown",
        "phase_status": "[COMPLETE | PARTIAL | BLOCKED]",
        "phase_name": "current agent's name",
        "task_brief": { "summary": "brief summary of this task", "intent": "[feature|bug]" },
        "gate_result": { "passed": true, "reason": "required if passed=false; omit otherwise" },
        "actions": [{
            "timestamp": "[YYYYMMDDHHmm] — when this step was written",
            "step": "one sentence — the action taken in this step",
            "description": "detail or rationale for this step"
        }],
        "context_pack": [{
            "timestamp": "[YYYYMMDDHHmm] — when this entry was written",
            "name": "[agent|subagent]: <AgentName>",
            "task_title": "one sentence — what was done in this entry",
            "decision": "the decision made, in detail",
            "reason": "step-by-step reasoning behind the decision",
            "modified": [{
                "reason": "what triggered a correction to this decision after the fact",
                "changed_files": [{ "path": "`{path}`", "description": "[add|modify|delete] file, brief description" }]
            }]
        }]
    }
}
```

- `github_issue_number` — fill this in as soon as the GitHub issue exists,
  even if it wasn't known on an earlier call for this same file (e.g. a
  subagent's mid-process log predates the phase agent creating the issue).
  Step 2 reads this field (alongside `$ES_ISSUE_NUMBER`) to decide whether
  to set `ES_DOC_ID`
- `actions` — ordered steps, including a spawned subagent's reported steps
  (prefix `description` with `Using subagent <AgentName>: ...`) — this is where
  step-by-step operations live
- `context_pack` — one entry per agent/subagent worth justifying: if a subagent
  ran, it must get an entry here (so its involvement is visible), but that entry
  holds only its decision/reason — never a step-by-step account of what it
  did (that's `actions`' job). Append, never overwrite. `modified` is only
  present if a decision was corrected after the fact (review feedback, gate
  failure)
- `timestamp` on every new `actions`/`context_pack` entry is the current time
  (`YYYYMMDDHHmm`) at the moment that entry is written — since the filename no
  longer carries a session timestamp, this is what lets you tell which run
  each entry came from once entries from multiple sessions pile up in the same
  file. Never edit the `timestamp` on an existing entry, only stamp new ones

---
## Step 1 — Resolve File, Merge, Write

```bash
# Priority: resolve the GitHub Issue ID first — check $ES_ISSUE_NUMBER (set by
# the calling agent, see Step 2's env var table) or the issue/PR URL/number
# given to this session (task brief, handoff.json, prior conversation).
if [[ -n "$ES_ISSUE_NUMBER" ]]; then
  FOLDER="issue-${ES_ISSUE_NUMBER}"
  SESSION_ID="${ES_ISSUE_NUMBER}-<agentName>"
else
  # Fallback only when no issue ID is known yet — no branch, no user
  # confirmation needed, just the agentName itself:
  # ponytail: assumes the caller always passes $ES_ISSUE_NUMBER once the
  # GitHub issue exists — the only legitimate "unknown" case is before any
  # issue has been created yet. No fallback re-read of the file needed here.
  FOLDER="<agentName>"
  SESSION_ID="<agentName>"
fi
cat ".claude/log/sessions/${FOLDER}/<agentName>.json" 2>/dev/null || echo "NEW"
```

- Resolve the GitHub Issue ID first — it decides the folder only (the
  filename is always `<agentName>.json`):
  - Found → folder `issue-<N>/`
  - Not found → folder `<agentName>/` (fallback — no branch involved)
- `SESSION_ID` is only the value for the `id` field inside the JSON content
  (`<N>-<agentName>`, or just `<agentName>` if no issue ID is known yet) —
  it plays no part in the file path
- If `$ES_ISSUE_NUMBER` is known when writing/merging this file, stamp it
  into `github_issue_number` so a later call (even without that env var
  set) can still find it by reading the file
- No timestamp in the filename, so the same `agentName` in the same
  folder (issue folder, or the `<agentName>/` fallback) always resolves to
  the same file, across sessions, and gets appended to rather than
  duplicated
- `agentName` = the top-level phase agent's role — the file belongs to the
  phase agent, never to a subagent it spawns. A subagent reports back into the
  phase agent's existing file (appending `actions`/`context_pack`); it never
  resolves or creates its own file. Unknown subagent name → use `unknown` for
  `context_pack[].name`
- If the file exists, append to `actions`/`context_pack` rather than
  overwriting; fill the schema above, omitting fields you can't fill — never
  leave placeholder strings like `"[value]"`
- Write with the Write tool (not a bash heredoc, to avoid JSON escaping issues)
  to `.claude/log/sessions/<FOLDER>/<agentName>.json`, then verify:
  ```bash
  node -e "JSON.parse(require('fs').readFileSync('.claude/log/sessions/<FOLDER>/<agentName>.json','utf8')); console.log('OK')"
  ```

---

## Step 2 — Index to Elasticsearch (best-effort)

Builds the envelope for `deptf2eelk-agent-logs` following the `elasticsearch`
skill's own **Document convention** (see that skill for the general contract) (flat searchable fields + the full session nested
under `payload`) — the naming/shape convention lives there, not here; this
step only decides _which_ flat fields matter for a session log. The transport
(env check + `curl`) is **inlined verbatim below** from that skill's
**Operation C** (ensure index), **Operation D** (get existing doc) and
**Operation A** (index) — so this step is directly runnable and no agent ever
hand-rolls its own `curl`. Best-effort — never blocks the handoff.

**Credentials are resolved once, up front** (step 0 below), using the same
contract as the elasticsearch skill: source the gitignored local
`.claude/.env.elasticsearch` fallback, then require `ELASTICSEARCH_URL` +
`ELASTICSEARCH_CREDS`. If either is missing, **skip the whole ES step cleanly
and exit** — a skip is a normal, expected outcome when ES isn't configured,
not a failure to work around. Never invent, guess, or hardcode a
URL/credential to force it through: a curl to an empty/guessed URL is exactly
what produces a `HTTP 000` dead-connection.

### Optional env vars (set by the calling agent before invoking log-keeper)

| Variable          | Source                       |
| ----------------- | ---------------------------- |
| `ES_JIRA_KEY`     | `issueSpec.jira.key`         |
| `ES_ISSUE_NUMBER` | `issue.github.number`        |
| `ES_GITHUB_URL`   | `issue.github.url`           |
| `ES_REPO`         | derived git remote           |
| `ES_PIPELINE`     | pipeline tag (e.g. `crc`)    |
| `GITHUB_RUN_ID`   | set automatically by Actions |

### Build the envelope and index it (transport inlined from the elasticsearch skill)

```bash
SESSION_FILE=".claude/log/sessions/<FOLDER>/<agentName>.json"

# 0. Resolve ES credentials up front — same contract as the elasticsearch
#    skill. Local .env fallback is gitignored; in CI the env: block sets these
#    directly (the source line is a harmless no-op there). If either var is
#    still unset, skip the whole ES step cleanly — the log already exists
#    locally. This guard is what prevents a curl to an empty URL (HTTP 000).
[ -f .claude/.env.elasticsearch ] && source .claude/.env.elasticsearch
if [[ -z "$ELASTICSEARCH_URL" || -z "$ELASTICSEARCH_CREDS" ]]; then
  echo "log-keeper: ELASTICSEARCH_URL/ELASTICSEARCH_CREDS not set — skipping ES index (log stays local)"
  exit 0
fi
export ES_INDEX="deptf2eelk-agent-logs"

# 1. Ensure the index exists (Operation C) — idempotent, safe every run.
#    Mirrors the mapping this pipeline actually uses for deptf2eelk-agent-logs.
node -e "
  const mapping = { mappings: { properties: {
    '@timestamp':   { type: 'date' },
    agent:          { type: 'keyword' },
    subagents:      { type: 'keyword' },
    jira_key:       { type: 'keyword' },
    issue_number:   { type: 'integer' },
    github_url:     { type: 'keyword' },
    repo:           { type: 'keyword' },
    branch:         { type: 'keyword' },
    pipeline:       { type: 'keyword' },
    phase_status:   { type: 'keyword' },
    gate_passed:    { type: 'boolean' },
    run_id:         { type: 'keyword' },
    payload:        { type: 'object', enabled: false }
  }}};
  require('fs').writeFileSync('${SESSION_FILE}.es-mapping.tmp', JSON.stringify(mapping));
"
export ES_MAPPING_FILE="${SESSION_FILE}.es-mapping.tmp"
STATUS=$(curl -skS -o /tmp/es-create-response.json -w "%{http_code}" \
  -X PUT "${ELASTICSEARCH_URL}/${ES_INDEX}" \
  -u "${ELASTICSEARCH_CREDS}" \
  -H "Content-Type: application/json" \
  --data-binary @"${ES_MAPPING_FILE}")
if [[ "$STATUS" == 2* ]]; then
  echo "ES index created → ${ES_INDEX} (HTTP ${STATUS})"
elif grep -q "resource_already_exists_exception" /tmp/es-create-response.json 2>/dev/null; then
  echo "ES index already exists → ${ES_INDEX} (no-op, idempotent)"
else
  echo "ES index creation failed (HTTP ${STATUS}):"; cat /tmp/es-create-response.json
fi
rm -f "${SESSION_FILE}.es-mapping.tmp"

# 2. Resolve the GitHub issue number — check $ES_ISSUE_NUMBER first, then
#    fall back to this file's own `github_issue_number` (stamped in Step 1
#    whenever known). Checked fresh here, not carried over from Step 1,
#    because the issue may have appeared only after this file's first write
#    (e.g. a subagent's mid-process log predates the phase agent creating
#    the issue).
ISSUE_NUM="${ES_ISSUE_NUMBER:-$(node -e "
  const d = JSON.parse(require('fs').readFileSync('${SESSION_FILE}', 'utf8'));
  console.log(d.session.github_issue_number || '');
")}"

if [[ -n "$ISSUE_NUM" ]]; then
  export ES_DOC_ID="${ISSUE_NUM}-<agentName>"

  # 3. GET the existing ES doc for this ID first (Operation D) — best-effort.
  #    A 404 just means this issue+agent has never been indexed before; that
  #    is a normal outcome, not a failure.
  STATUS=$(curl -skS -o /tmp/es-get-response.json -w "%{http_code}" \
    -X GET "${ELASTICSEARCH_URL}/${ES_INDEX}/_doc/${ES_DOC_ID}" \
    -u "${ELASTICSEARCH_CREDS}")
  # On a 200, /tmp/es-get-response.json holds the doc for the reconcile step.
  # On a 404/error, drop the body so step 4 below skips silently.
  [[ "$STATUS" == "200" ]] || rm -f /tmp/es-get-response.json

  # 4. Reconcile — append any actions/context_pack entries present in the
  #    fetched ES payload but missing locally (matched by timestamp), then
  #    write the merged result BACK to SESSION_FILE. This recovers history
  #    even when the local file itself didn't survive (fresh clone,
  #    ephemeral CI runner) — ES is treated as the durable copy, local isn't.
  #    Skip silently if the GET 404'd or ES was unreachable (no response file).
  if [ -f /tmp/es-get-response.json ]; then
    node -e "
      const fs = require('fs');
      const getRes = JSON.parse(fs.readFileSync('/tmp/es-get-response.json', 'utf8'));
      if (getRes.found && getRes._source && getRes._source.payload) {
        const remote = getRes._source.payload;
        const d = JSON.parse(fs.readFileSync('${SESSION_FILE}', 'utf8'));
        const local = d.session;
        const seenActions = new Set(local.actions.map(a => a.timestamp + '|' + a.step));
        for (const a of (remote.actions || [])) {
          const key = a.timestamp + '|' + a.step;
          if (!seenActions.has(key)) { local.actions.push(a); seenActions.add(key); }
        }
        const seenPack = new Set(local.context_pack.map(c => c.timestamp + '|' + c.name));
        for (const c of (remote.context_pack || [])) {
          const key = c.timestamp + '|' + c.name;
          if (!seenPack.has(key)) { local.context_pack.push(c); seenPack.add(key); }
        }
        local.actions.sort((a, b) => a.timestamp.localeCompare(b.timestamp));
        local.context_pack.sort((a, b) => a.timestamp.localeCompare(b.timestamp));
        fs.writeFileSync('${SESSION_FILE}', JSON.stringify(d, null, 4));
      }
    "
    rm -f /tmp/es-get-response.json
  fi
fi
# else: no issue number yet — leave ES_DOC_ID unset, skip the GET/reconcile,
# and fall straight through to a plain auto-id POST below.

# 5. Build flat envelope → temp file, from the (possibly reconciled) session
node -e "
  const d    = JSON.parse(require('fs').readFileSync('${SESSION_FILE}', 'utf8'));
  const sess = d.session;
  const subagents = (sess.context_pack || [])
    .map(e => e.name || '')
    .filter(n => n.startsWith('subagent:'))
    .map(n => n.replace(/^subagent:\s*/, '').trim());
  const doc = {
    '@timestamp':  new Date().toISOString(),
    agent:         sess.phase_name   || null,
    subagents,
    jira_key:      process.env.ES_JIRA_KEY      || null,
    issue_number:  process.env.ES_ISSUE_NUMBER  ? parseInt(process.env.ES_ISSUE_NUMBER) : null,
    github_url:    process.env.ES_GITHUB_URL    || null,
    repo:          process.env.ES_REPO          || null,
    branch:        process.env.BRANCH           || null,
    pipeline:      process.env.ES_PIPELINE      || null,
    phase_status:  sess.phase_status || null,
    gate_passed:   sess.gate_result  ? sess.gate_result.passed : null,
    run_id:        process.env.GITHUB_RUN_ID    || null,
    payload:       sess
  };
  require('fs').writeFileSync('${SESSION_FILE}.es.tmp', JSON.stringify(doc));
"

# 6. Index the document — Operation A, inlined from the elasticsearch skill.
#    ES_DOC_ID set above (issue known) → upsert, keeping ES in sync.
#    ES_DOC_ID unset (no issue yet) → plain auto-id POST — a new record
#    each call until the issue number is known.
export ES_PAYLOAD_FILE="${SESSION_FILE}.es.tmp"
if [[ -n "$ES_DOC_ID" ]]; then
  METHOD="PUT";  URL="${ELASTICSEARCH_URL}/${ES_INDEX}/_doc/${ES_DOC_ID}"   # upsert — same id overwrites
else
  METHOD="POST"; URL="${ELASTICSEARCH_URL}/${ES_INDEX}/_doc"                # auto-id — new doc each call
fi
STATUS=$(curl -skS -o /tmp/es-index-response.json -w "%{http_code}" \
  -X "${METHOD}" "${URL}" \
  -u "${ELASTICSEARCH_CREDS}" \
  -H "Content-Type: application/json" \
  --data-binary @"${ES_PAYLOAD_FILE}")
if [[ "$STATUS" == 2* ]]; then
  RESULT=$(node -e "console.log(JSON.parse(require('fs').readFileSync('/tmp/es-index-response.json','utf8')).result)")
  echo "ES ${RESULT} → ${ES_INDEX} (HTTP ${STATUS})"   # result: "created" or "updated"
else
  echo "ES index failed (HTTP ${STATUS}):"; cat /tmp/es-index-response.json
fi

rm -f "${SESSION_FILE}.es.tmp"
```

Never retry — the log exists locally; ES is a bonus sink.

---

## When to Call This Skill

| Trigger                             | Who calls it                                                                       |
| ----------------------------------- | ---------------------------------------------------------------------------------- |
| Phase agent completes (any outcome) | That agent, before returning                                                       |
| Subagent completes (any outcome)    | The phase agent that spawned it — appends a `context_pack` entry into its own file |
| Standalone task completes           | You, manually                                                                      |

The log is append-only per session. Never delete a phase entry — mark it
`BLOCKED` or `PARTIAL` instead.

