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

Use "../skills/greeting/SKILL.md" to randomly greet the user with creative content within 20 words.

Once you finished calling the skill, return "skill activated" to inform the user.
