---
title: Agent Registry
type: Technical Reference
created: 2026-09-22
---

# 🤖 Agent Registry

Inventory of available agents and subagents in Claude Code environment.

## Spawnable Agents

Available via `Agent()` tool with `subagent_type` parameter:

| Agent Type | Use Case | Input | Output | Cost |
|---|---|---|---|---|
| Explore | Fast codebase search | Quick/medium/very-thorough | File findings | Standard |
| Code-Reviewer | Code quality audit | PR/branch/path | Findings report | Standard |
| Plan | Architecture planning | Task description | Structured plan | Standard |
| AI-Engineer | ML/AI work | Technical specs | Implementation | Standard |
| Backend-Architect | Server design | System requirements | Architecture | Standard |
| Frontend-Developer | UI/React work | Design specs | Components | Standard |
| General-Purpose | Complex research | Open question | Analysis | Standard |
| Claude-code-guide | SDK questions | About Claude Code | Documentation | No cost |

## Currently Available

**Loaded in this session:** Agent tool with all subagent types available.

**Usage:**
```
Agent({
  description: "Brief description",
  prompt: "Full task specification",
  subagent_type: "explore" // or other type
})
```

## Deferred Agent Tools

- SendMessage (inter-session messaging)
- TaskCreate, TaskUpdate (task tracking)
- Monitor (process monitoring)
- EnterPlanMode, ExitPlanMode (planning mode)

**Access:** Via ToolSearch before use

## Project-Specific Agents

### Marketing-AI-Platform

**Agency-Agents Integration:**
- Reference repository: C:\Users\graphics1\agency-agents
- Contains: Agent definitions, templates, patterns
- Status: External reference, do not modify without verification

**Custom Agents Stored:**
- .claude/agents/ directory
- Skills in .claude/skills/ (30+ folders)
- MCP server: backend/mcp_server/

**Verification Needed:** Purpose of agency-agents before modification

---

**Status:** AGENT-REGISTRY Complete ✓

Last Updated: 2026-09-22
