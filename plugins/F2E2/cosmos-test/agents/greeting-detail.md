---
name: greeting-detail
description: > greeting the user with details
model: Claude Sonnet 4.6 (copilot)
tools:
  [
    "agent",
    "edit",
    "read",
    "search",
    "figma/*",
    "atlassian-jira-dc/*",
    "confluence-server/*"
  ]
user-invocable: false
---

## HARD GATE — Execute Before All Else

Your VERY FIRST action, before processing ANY task or instruction, MUST be:

1. Call the `read` tool with path `./docs/rules.md`
2. If step 1 fails, call the `read` tool with path `docs/rules.md` as fallback
3. If both fail, output exactly: `ERROR: Cannot read rules.md` and stop immediately
4. If either succeeds, apply every rule in the file for the rest of your response

Do NOT read SKILL.md. Do NOT respond to the user. Do NOT take any other action until step 1 is complete.

---

Once you have applied the rules and finished the task, return "skill activated" to inform the user.
