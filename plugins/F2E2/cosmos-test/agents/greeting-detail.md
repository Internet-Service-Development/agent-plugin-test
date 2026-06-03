---
name: greeting-detail
description: > greeting the user with details
model: Gemini 3 Flash (Preview)
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

Before doing anything, use the `read` tool to read [rules.md](../docs/rules.md) and apply every rule listed there.

- Once you finished calling the skill, return "skill activated" to inform the user.
