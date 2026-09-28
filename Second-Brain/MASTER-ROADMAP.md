---
title: Master Roadmap
type: Planning
created: 2026-09-22
updated: 2026-09-22
---

# 🗺️ Master Roadmap

Unified roadmap of all projects across the workspace. Tasks are ordered by real priority (business value + urgency + feasibility).

## Priority Framework

**Priority 1 — CRITICAL (Blockers):**  
Problems preventing installation, startup, build, test, or deployment.

**Priority 2 — IN PROGRESS (Complete Current Features):**  
Features started but incomplete; immediate next steps to reach stable state.

**Priority 3 — LAUNCH (Business Value):**  
Elements needed to publish, acquire customers, get users, or generate revenue.

**Priority 4 — IMPROVEMENTS (Polish & Scale):**  
Optimization, design, automation, performance, and future enhancements.

---

## 🎯 ACTIVE ROADMAP

### P1 — Critical Blockers

None detected. All projects are runnable or already running.

---

### P2 — Complete Current Features

#### TASK-001: PROS360ERA - Verify and Deploy EVOLUSA Migration

**Project:** PROS360ERA  
**Status:** In Progress  
**Branch:** feat/evolusa-migration  
**Priority:** High  
**Effort:** 2-4 hours  
**Owner:** Mauricio  

**Objective:**  
Ensure the EVOLUSA migration feature branch is complete, tested, and ready for merge to main. Verify all new pages, forms, and integrations work correctly.

**Current State:**
- Branch: feat/evolusa-migration (active)
- Clean Git state (no uncommitted changes)
- Latest commits:
  - Public professional application page added
  - NOTARY included in regulated services
  - Plan de Crédito linked

**Acceptance Criteria:**
- Dev server starts without errors
- All pages render correctly
- Public professional application page works
- Forms submit successfully
- Plan de Crédito links function
- No TypeScript errors
- Lint passes
- Build completes

**Blockers:**
None identified.

**Next Steps:**
1. Start dev server: `npm run dev`
2. Test all EVOLUSA-related pages
3. Verify forms and integrations
4. Run lint and typecheck
5. Review commits before merge
6. Recommend merge strategy

**Completion Indicator:**  
Feature branch tested, documented, and ready for merge.

---

#### TASK-002: Marketing-AI-Platform - Audit and Stabilize Resource Living QA Gate

**Project:** Marketing-AI-Platform  
**Status:** Active  
**Branch:** work/resource-living-live-audit-rescue  
**Priority:** High  
**Effort:** 4-6 hours  
**Owner:** Mauricio  

**Objective:**  
Audit the current state of the Resource Living brand QA gate, verify the implementation, test the API, and ensure all integrations work. Identify and fix any breaking issues.

**Current State:**
- Branch: work/resource-living-live-audit-rescue
- 40+ modified files (backend + frontend)
- Python backend changes in multiple services
- React frontend components modified
- 2 stashes with previous work (social publisher, MCP)
- SQLite adsets.updated_at issue noted

**Known Changes:**
- resource_living_creative_registry.py - Registry service
- content_quality_gate.py - QA gate implementation
- organic_growth_automation_service.py - Growth automation
- paid_creative_direction.py - Creative direction service
- Tests added for QA gate

**Acceptance Criteria:**
- Backend server starts without errors
- Frontend dev server starts without errors
- Resource Living QA gate endpoint responds
- Brand QA validation works
- Tests pass (if available)
- No critical Python errors
- No TypeScript errors in frontend
- SQLite database queries work

**Blockers:**
- Possible SQLite schema issue (adsets.updated_at)
- Meta Graph API permissions (for social publisher features)
- MCP server dependencies

**Next Steps:**
1. Install backend dependencies: `pip install -r requirements.txt`
2. Start backend: `python -m backend.main`
3. Check for SQLite errors in database operations
4. Install frontend dependencies: `npm install`
5. Start frontend: `npm run dev`
6. Test QA gate endpoint
7. Review stashed changes (optional)
8. Document findings

**Completion Indicator:**  
Both backend and frontend running, QA gate functional, no critical errors.

---

#### TASK-003: BELONG-v25-candidate - Audit and Verify State

**Project:** BELONG (Read-Only Candidate)  
**Status:** Paused / Verification Pending  
**Branch:** master  
**Priority:** Medium  
**Effort:** 2-3 hours  
**Owner:** Mauricio / Research  

**Objective:**  
Perform thorough audit of the BELONG v25 candidate. Determine if this is the canonical BELONG implementation or a historical version. Verify structure, dependencies, and potential to run.

**Current State:**
- No remote configured (local-only repository)
- 3 local modifications (opportunity, matchers, connections)
- Single commit in history: `89bb0af` baseline
- Next.js + Supabase structure
- Multiple test suites defined

**Key Components Detected:**
- Opportunity engine (opportunity-screen.tsx, matchers.ts)
- Connections system (lib/actions/connections.ts)
- Project management
- Reputation system
- Multiple test suites (AI copilot, community, mission, organization, project, realtime, reputation)

**Acceptance Criteria (Verification):**
- Document ownership status (canonical vs candidate)
- Verify dependencies are installable
- Determine if it can start dev server
- Understand purpose of modifications
- Assess completeness of feature set
- Decide if canonical BELONG exists elsewhere

**Blockers:**
- Unknown if this is the canonical version
- No remote configured
- Local modifications need explanation

**Next Steps:**
1. Document findings in Second Brain
2. Note: This is READ-ONLY during this session
3. Defer modification until canonical status confirmed
4. If canonical: create BELONG project folder with detailed docs
5. If not canonical: archive in 99-Archive

**Completion Indicator:**  
Audit report generated; status (canonical/candidate/archive) determined.

---

### P3 — Business Launch Features

#### TASK-004: Mauricio-Portfolio - Asset Organization

**Project:** Mauricio-Portfolio  
**Status:** Maintenance  
**Priority:** Medium  
**Effort:** 2-3 hours  
**Owner:** Mauricio  

**Objective:**  
Review asset deletion state in portfolio. Confirm whether deletions are intentional reorganization or accidental. Restore or clean up as needed.

**Current State:**
- Many project assets deleted (branding, loana, stamina, etc.)
- New asset images added (evenflo, getlost, microbeau)
- Overall portfolio reorganization in progress

**Next Steps:**
1. Review git diff for asset changes
2. Determine if deletions are intentional
3. If intentional: validate new portfolio structure
4. If accidental: consider restoration from commit history
5. Verify portfolio renders without broken images

---

#### TASK-005: RealGroup-Website - Asset Synchronization

**Project:** RealGroup-Website  
**Status:** Asset Management  
**Priority:** Medium  
**Effort:** 2-3 hours  
**Owner:** Mauricio  

**Objective:**  
Resolve asset deletion state. Confirm final asset inventory and update package.json accordingly. Ensure website renders without missing resources.

**Current State:**
- 200+ image files deleted from assets/projects/
- 70+ video files deleted from assets/videos/
- Logo reorganization in progress
- app/page.tsx modified

**Next Steps:**
1. Verify website starts without errors
2. Check console for missing asset warnings
3. Confirm intended deletions vs accidental
4. Update package.json if needed
5. Validate all pages render

---

### P4 — Improvements & Optimization

#### FUTURE-001: Full Test Suite Implementation

Complete test coverage for all active projects (PROS360ERA, Marketing-AI-Platform).

---

#### FUTURE-002: Documentation Generation

Auto-generate API documentation from code for all backends.

---

#### FUTURE-003: CI/CD Pipeline Setup

Establish automated builds, tests, and deployments for all projects.

---

## 📊 Work Selection Strategy

### Next Immediate Action

**START WITH: TASK-001 (PROS360ERA)**

**Rationale:**
1. Highest business value (EVOLUSA multiservices platform)
2. Cleanest Git state (no conflicts or complications)
3. Fastest to verify (2-4 hours)
4. Fewest external dependencies
5. Success enables immediate deployment

**After TASK-001 Complete:**
→ Move to TASK-002 (Marketing-AI-Platform audit)

**After TASK-002 Complete:**
→ Move to TASK-003 (BELONG verification)

**Parallel (if time allows):**
→ TASK-004 and TASK-005 (Asset management)

---

## 🔄 Priority Recalibration

This roadmap should be revisited after each task completion. Business priorities may change based on:
- Client requirements
- Market opportunities
- Team capacity
- External dependencies

Current assessment assumes:
- All projects should be maintained
- Revenue priority: PROS360ERA, Resource Living (within Marketing-AI)
- Strategic priority: BELONG (if canonical)
- Portfolio priority: Mauricio-Portfolio

---

Last Updated: 2026-09-22  
Next Review: After TASK-001 completion
