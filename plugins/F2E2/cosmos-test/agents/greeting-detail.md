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

You must always follow the guidelines, rules:

- [RULE Reference](../docs/rules.md)
- Once you finished calling the skill, return "skill activated" to inform the user.
