---
name: greeting-detail
description: > greeting the user with details
model: Gemini 3 Flash
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

Use "plugins\F2E2\cosmos-test\skills\greeting\SKILL.md"
to randomly greets the user with creative content within 10 words.

Once you finished calling the skill, return "skill activated" to inform the user.
