---
title: Automation Registry
type: Technical Reference
created: 2026-09-22
---

# ⚙️ Automation Registry

Inventory of automation capabilities, hooks, routines, and scheduled tasks.

## Automation Technologies Available

### Claude Code Native

- **Scheduled Tasks:** Via `/schedule` skill (cloud-based cron)
- **Autonomous Loops:** Via `/loop` skill (dynamic self-pacing)
- **Hooks:** Via `update-config` skill (Git hooks, pre-commit, etc.)
- **Background Processes:** Via `run_in_background` parameter on Bash tool

### Operating System

- **Windows Task Scheduler:** Available for standalone scripts
- **PowerShell Scheduled Tasks:** Available

### External Platforms

- **GitHub Actions:** Available (workflow files in .github/workflows/)
- **Vercel Cron:** Available for Next.js projects (serverless functions)
- **Supabase Edge Functions:** Available for backend functions
- **Zapier:** Configured but unavailable in this session

## Currently Implemented Automations

### Phase 2 Status

**Scheduled Tasks:** None activated yet  
**Hooks:** None configured yet  
**Routines:** None configured yet  
**Loops:** None active  

**Reason:** Awaiting Phase 11 approval before activation

## Planned Daily Operating System

**Status:** Design phase (PHASE 7)  
**Entry Point:** control-plane/scripts/daily-cycle.ps1  
**Frequency:** Once daily (time TBD)  
**Leader:** Office computer (candidate)  
**Coordination:** Locking mechanism (not yet implemented)  

### Stages

1. Context recovery
2. Repository health
3. Production health
4. Business intelligence
5. Prioritization
6. Autonomous execution
7. Verification
8. Documentation
9. Daily report

## Automation Leader Policy

**Office Machine:** Candidate primary (scheduler disabled)  
**Home Machine:** Secondary (scheduler disabled)  

**Before Activation:**
1. Dry-run complete
2. Owner approval received
3. Locking mechanism tested
4. Failure recovery tested

## Approval Gates

These actions require approval before automation:

- Pushing to repository
- Merging branches
- Deploying to production
- Activating advertising
- Spending money
- Sending external communications
- Publishing content
- Modifying authentication/permissions
- Changing production data

---

**Status:** AUTOMATION-REGISTRY Complete (Design Phase) ✓

Last Updated: 2026-09-22
