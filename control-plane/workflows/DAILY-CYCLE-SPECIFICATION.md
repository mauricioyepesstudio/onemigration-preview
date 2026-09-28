---
title: Daily Operating Cycle Specification
type: Workflow Design
date: 2026-09-22
phase: 7
status: Design Complete (Implementation Pending Approval)
---

# 📅 Daily Operating Cycle Specification

9-stage autonomous daily workflow for continuous project operations.

---

## CYCLE OVERVIEW

**Frequency:** Once daily (time configurable, default 09:00 AM)  
**Leader:** Office computer (candidate primary)  
**Duration:** ~30-60 minutes (estimated)  
**Entry Point:** control-plane/scripts/daily-cycle.ps1  

---

## STAGE 1: CONTEXT RECOVERY (5 min)

**Objective:** Establish current state and prevent duplicate work

**Actions:**
1. Read HOME.md (orientation)
2. Read PROJECT-INDEX.md (project status)
3. Read MASTER-ROADMAP.md (priorities)
4. Read SESSION-HANDOFF.md (previous session state)
5. Read BLOCKERS.md (external issues)
6. Read ACTIVITY-LOG.md (recent work)
7. Load tool registries (TOOL-REGISTRY.md, SKILL-ROUTING.md)
8. Load project registry from control-plane/state/projects-status.json
9. Load last-cycle.json (time, stage, status)

**Output:** Current state confirmed, no duplicate work risk

**Failure Recovery:**
- If HOME.md missing: Stop, alert operator
- If JSON files corrupted: Use backups, alert operator

---

## STAGE 2: REPOSITORY HEALTH CHECK (10 min)

**Objective:** Detect code issues, dependency problems, uncommitted work

**For Each Repository:**
1. Check Git status (branch, commit, remote)
2. Verify no uncommitted changes blocking work
3. Check for stashed work
4. Detect dependency issues:
   - package.json outdated?
   - requirements.txt outdated?
   - Node version mismatch?
   - Python version mismatch?
5. Run type checks (if applicable): `npm run typecheck`
6. Run linting: `npm run lint` or equivalent
7. Detect build errors: `npm run build --dry-run`
8. Update ACTIVITY-LOG.md with findings

**Safe Actions Only:**
- ✓ Check status
- ✓ Detect errors
- ❌ Never pull, merge, reset, or modify

**Output:** Repository health report

---

## STAGE 3: PRODUCTION HEALTH CHECK (10 min)

**For Each Project with Production:**
1. Check availability: Ping health-check URL
2. Check API endpoints: Make test requests (read-only)
3. Check deployment status (Vercel dashboard)
4. Check database connectivity (Supabase, read-only)
5. Check recent errors in logs
6. Check scheduled jobs status

**Safe Operations Only:**
- ✓ Read health status
- ✓ Check metrics
- ❌ Never modify production data

**Output:** Production health report

---

## STAGE 4: BUSINESS INTELLIGENCE (10 min)

**Research & Analytics:**
1. Review product objectives (MASTER-ROADMAP.md)
2. Check analytics (Windsor.ai, if available)
3. Review lead generation metrics (projects tracking)
4. Review campaign performance
5. Competitive landscape research (Firecrawl search)
6. Market trends research
7. Identify opportunities and risks

**Tools:**
- Windsor.ai (if authenticated)
- Firecrawl (web search)
- Analytics platforms
- Manual research

**Output:** Opportunities, risks, intelligence report

---

## STAGE 5: PRIORITIZATION (5 min)

**Scoring Task Selection:**
1. Review NEXT-ACTIONS.md priority queue
2. Score remaining tasks by:
   - Business impact (1-10)
   - Revenue potential (1-10)
   - User impact (1-10)
   - Urgency (1-10)
   - Complexity (1-5)
   - Effort (hours)
   - Dependency status (blocked?)
   - Verification confidence (can test?)
   
3. Calculate priority score: (impact + revenue + user + urgency) / complexity
4. Select:
   - 1 primary task (highest score)
   - 1 secondary task (backup)
   - Maintenance tasks (docs, minor fixes)
   - Blocked tasks (note, don't start)

**Output:** Prioritized task list for execution

---

## STAGE 6: AUTONOMOUS EXECUTION (15-30 min)

**Safe Autonomous Actions Only:**
- ✓ Local code improvements
- ✓ Bug fixes (safe, tested)
- ✓ Test creation
- ✓ Documentation updates
- ✓ Research and analysis
- ✓ Safe dependency patches
- ✓ UI improvements
- ✓ API repairs (safe, read-only DB)
- ✓ Build corrections
- ✓ Performance improvements
- ✓ Accessibility improvements
- ✓ SEO improvements
- ✓ Content drafts

**Never Autonomous:**
- ❌ Push to repository
- ❌ Merge branches
- ❌ Deploy to production
- ❌ Modify production data
- ❌ Change authentication
- ❌ Activate advertising
- ❌ Spend money

**Each Action Must Have:**
- Clear objective
- Success criteria
- Tests to verify
- Rollback path
- Audit trail (git log)

**Output:** Work completed, files modified, tests run

---

## STAGE 7: VERIFICATION (5-10 min)

**For All Changes Made:**
1. Run linting: `npm run lint` or equivalent
2. Run type-checking: `npm run typecheck`
3. Run unit tests: `npm test`
4. Run integration tests (if applicable)
5. Verify production build: `npm run build`
6. Check API endpoints (if changed)
7. Browser verification (if UI changed)
8. Database checks (if data changed)
9. Security checks (if applicable)
10. Accessibility checks (if UI changed)
11. SEO checks (if content changed)

**Output:** Verification report (pass/fail/warnings)

---

## STAGE 8: DOCUMENTATION UPDATE (5 min)

**Update All Tracking Documents:**
1. ACTIVITY-LOG.md — Add session summary
2. PROJECT-INDEX.md — Update project status
3. MASTER-ROADMAP.md — Update task completion
4. NEXT-ACTIONS.md — Update queue
5. SESSION-HANDOFF.md — Prepare for next session
6. BLOCKERS.md — Update issues
7. state/last-cycle.json — Record completion time
8. state/projects-status.json — Update metrics

**Output:** All documentation current

---

## STAGE 9: DAILY REPORT GENERATION (5 min)

**Create:** control-plane/reports/YYYY-MM-DD-DAILY-REPORT.md

**Include:**
- Execution date/time
- Stage completion times
- Repository health summary
- Production status summary
- Research findings (if any)
- Work completed
- Files modified
- Tests and builds (pass/fail)
- Errors discovered and corrected
- Opportunities identified
- Blockers encountered
- Decisions requiring approval
- External dependencies
- Next priority (recommendation)
- Metrics and KPIs

**Output:** Daily report file

---

## APPROVAL QUEUE INTEGRATION

**Actions Requiring Approval:**
- Push to repository
- Merge branches  
- Deploy to production
- Spend money
- Activate advertising
- Send communications
- Publish content
- Database migrations (production)
- Authentication changes

**Workflow:**
1. If action requires approval, add to APPROVAL-QUEUE.md
2. Include: action, project, reason, benefit, risk, cost, files affected, rollback plan
3. Note recommendation (approve/deny)
4. Continue with other unblocked work
5. Don't wait idle for approval

---

## FAILURE RECOVERY

**Partial Progress Preservation:**
- Record stage completion in state/last-cycle.json
- Save partial reports
- Log errors with timestamps
- Identify which stage failed

**Retry Logic:**
- Transient network errors: Retry once with exponential backoff
- Timeout errors: Retry with increased timeout
- Resource errors: Skip optional work, retry core cycle
- Permanent errors: Stop, log, alert

**Never:**
- Hide errors from reports
- Retry destructive operations
- Attempt same operation infinitely
- Continue blindly after critical failure

**Continue After Failure:**
- Fix identified issue
- Update SESSION-HANDOFF.md
- Re-run from failed stage (not restart)
- Document remediation in ACTIVITY-LOG.md

---

## OVERLAP PREVENTION

**Locking Mechanism:**
- Create state/locks/daily-cycle.lock before starting
- Lock contains: machine name, start time, last heartbeat, stage
- Heartbeat updates every 5 minutes
- If lock age > 2 hours, consider stale and override
- Second machine checks lock before starting
- Release lock after cycle completes

**Office/Home Coordination:**
- Office = primary (can run automation)
- Home = secondary (read-only, no automation)
- Only office machine can be automation_leader
- Home machine can run dev servers, tests, research

---

## CYCLE MONITORING

**System Should Track:**
- ✓ Cycle start time
- ✓ Each stage completion time
- ✓ Total duration
- ✓ Errors and warnings
- ✓ Actions taken
- ✓ Approval queue size
- ✓ Next cycle time

**Alerting (Future):**
- If cycle takes >120 minutes: alert
- If stage fails: alert
- If database health critical: alert
- If production error rate high: alert

---

## Configuration

**control-plane/config/workspace.local.json:**
```json
{
  "automation": {
    "daily_cycle_enabled": false,
    "daily_cycle_time": "09:00",
    "timezone": "America/New_York",
    "max_parallel_tasks": 2,
    "stage_timeouts": {
      "context_recovery": 300,
      "repo_health": 600,
      "prod_health": 600,
      "business_intel": 600,
      "prioritization": 300,
      "execution": 1800,
      "verification": 600,
      "documentation": 300,
      "daily_report": 300
    }
  }
}
```

---

## Status: PHASE 7 DESIGN COMPLETE ✓

**9-Stage Workflow:** Fully specified  
**Safety Mechanisms:** Documented  
**Failure Recovery:** Designed  
**Approval Gates:** Integrated  
**Monitoring:** Defined  

**Ready for:** PHASE 9 (Manual Dry-Run Testing)

---

Last Updated: 2026-09-22
