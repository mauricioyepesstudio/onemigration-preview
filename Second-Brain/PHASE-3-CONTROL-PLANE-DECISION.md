---
title: Phase 3 Control-Plane Decision
type: Architecture Decision
date: 2026-09-22
phase: 3
status: Complete
---

# 🎯 Phase 3 — Control-Plane Decision

## Decision: CREATE SEPARATE CONTROL PLANE

**Verdict:** agency-agents is NOT suitable as central control plane.

**Recommendation:** Create new `C:\Users\graphics1\AI-Projects\control-plane` repository.

---

## Agency-Agents Audit Findings

### Repository Purpose

**What it is:**
- Collection of AI agent personality templates
- Documentation for specialized expert agents
- Reference implementation for agent definitions
- Installation tool for Claude Code, Cursor, Gemini, etc.

**What it is NOT:**
- Central orchestration system
- Project coordination platform
- State management system
- Control plane or command center

### Structure Analysis

```
agency-agents/
├── .claude/              (local Claude config)
├── .claude-flow/         (local Claude flow config)
├── .mcp.json            (local MCP config)
├── .swarm/              (local swarm config)
├── academic/            (agent definitions)
├── design/              (agent definitions)
├── [other divisions]/   (agent definitions)
├── README.md            (documentation)
├── CLAUDE.md            (this repo's instructions)
└── scripts/             (installation helpers)
```

### Purpose Verification

**From README.md:**
> "Born from a Reddit thread and months of iteration, The Agency is a growing collection of meticulously crafted AI agent personalities."

**Key Features:**
- 🎯 Specialized agent definitions
- 🧠 Personality-driven templates
- 📋 Deliverable-focused processes
- ✅ Production-ready workflows
- 🚀 Installation tools for various platforms

### Why NOT Suitable as Control Plane

| Requirement | Agency-Agents | Needed for Control Plane |
|---|---|---|
| Project Registry | ❌ None | ✓ Central project DB |
| State Management | ❌ None | ✓ Track automation state |
| Orchestration Logic | ❌ None | ✓ Coordinate daily cycles |
| Workflow Definitions | ✓ Yes | ✓ Yes (different purpose) |
| Configuration Store | ⚠️ Limited | ✓ Workspace config |
| Approval Queue | ❌ None | ✓ Required |
| Health Monitoring | ❌ None | ✓ Required |
| Reports Directory | ❌ None | ✓ Required |
| Machine Coordination | ❌ None | ✓ Locking, leader election |

### Local Modifications Status

**Modifications found in agency-agents:**
- `.claude/` directory (Claude Code config)
- `.claude-flow/` directory (Claude flow config)
- `.mcp.json` (MCP configuration)
- `.swarm/` directory (swarm configuration)
- `CLAUDE.md` (this repo's instructions)
- `ruvector.db` (database file)
- Modified `.gitignore`

**Status:** These are local-only modifications that should not be committed to upstream.

### Risk Assessment

**Risk of Using Agency-Agents as Control Plane:** HIGH
- Mixing concerns (agent templates + orchestration)
- Upstream contributions would contaminate control flow
- No clear separation of concerns
- Would complicate agent reference updates
- State management would be awkward

---

## Decision: CREATE DEDICATED CONTROL PLANE

**New Repository Location:** C:\Users\graphics1\AI-Projects\control-plane

**Purpose:** Central orchestration, coordination, and state management for all AI-Projects

**Not included:** Agent definitions or personality templates (those stay in agency-agents)

**Relationship:** 
- agency-agents = Agent library/reference
- control-plane = Orchestration and coordination

---

## Control-Plane Directory Structure

```
control-plane/
├── config/
│   ├── workspace.example.json    (template, committed)
│   └── workspace.local.json      (.gitignore'd, machine-specific)
├── scripts/
│   ├── bootstrap-home.ps1        (home computer setup)
│   ├── check-sync-health.ps1     (sync health check, read-only)
│   ├── daily-cycle.ps1           (main orchestration loop)
│   └── lock-manager.ps1          (office/home coordination)
├── workflows/
│   ├── daily-context-recovery.ps1
│   ├── daily-repo-health.ps1
│   ├── daily-prod-health.ps1
│   ├── daily-business-intel.ps1
│   ├── daily-prioritize.ps1
│   ├── daily-execute.ps1
│   ├── daily-verify.ps1
│   ├── daily-document.ps1
│   └── daily-report.ps1
├── prompts/
│   ├── daily-context.md
│   ├── prioritization.md
│   ├── opportunity-finder.md
│   └── risk-analyzer.md
├── reports/
│   ├── 2026-09-22-DAILY-REPORT.md (first report)
│   └── [daily reports]
├── logs/
│   ├── automation.log
│   ├── errors.log
│   └── [execution logs]
├── state/
│   ├── automation-leader.json    (office vs home)
│   ├── last-cycle.json           (cycle tracking)
│   ├── projects-status.json      (project registry)
│   └── locks/
│       └── daily-cycle.lock      (overlap prevention)
├── monitors/
│   ├── git-monitor.ps1
│   ├── prod-health-monitor.ps1
│   └── dependency-monitor.ps1
├── approvals/
│   └── APPROVAL-QUEUE.md         (pending approvals)
├── README.md                      (control-plane documentation)
└── .gitignore                     (exclude workspace.local.json, logs, state)
```

---

## Next Steps

**PHASE 4:** Create portable project registry and config files  
**PHASE 5:** Create office/home portability scripts  
**PHASE 7:** Implement daily orchestration workflows  

---

## Status: PHASE 3 COMPLETE ✓

**Decision Made:** Separate control-plane repository needed  
**Agency-Agents:** Remains as agent library/reference (do not modify without upstream approval)  
**Action:** Create control-plane directory structure (PHASE 4)

---

Last Updated: 2026-09-22
