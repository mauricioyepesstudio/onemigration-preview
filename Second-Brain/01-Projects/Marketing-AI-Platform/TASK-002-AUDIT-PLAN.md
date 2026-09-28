---
title: TASK-002 Audit Plan
type: Task Specification
project: Marketing-AI-Platform
status: Planned
priority: High
---

# TASK-002: Marketing-AI-Platform Audit

## Objective

Audit Resource Living brand QA gate implementation. Verify backend and frontend integration, test API endpoints, identify any blocking issues.

## Current State

**Branch:** `work/resource-living-live-audit-rescue`  
**Status:** Active development  
**Modified Files:** 40+ (backend Python + frontend React)  
**Stashes:** 2 (previous work preserved)  
**Blockers:** None identified for audit phase  

## Pre-Audit Findings

### Environment
- Python: 3.14.7 ✓ (available)
- pip: 26.2.1 ✓ (available)
- requirements.txt: 37 packages defined
- No venv created (needs creation or pip install)

### Project Structure
```
backend/
├── main.py (FastAPI entry point)
├── api/ (API endpoints)
├── ai/ (AI services - includes Resource Living specific)
│   ├── resource_living_*.py (Multiple Resource Living modules)
│   └── services/
│       ├── content_quality_gate.py (QA Gate - TARGET for audit)
│       ├── branded_content_service.py
│       └── organic_growth_automation_service.py
├── models/ (SQLAlchemy models)
├── services/ (Business logic)
├── database/ (ORM + CRUD)
└── meta/ (Meta Graph API client)

frontend/
├── package.json (Next.js)
├── [will need separate audit]

tests/
├── test_content_quality_gate.py
└── [other test files]
```

### Key Classes Identified
- **ContentQualityGate**: Main QA gate service (content_quality_gate.py)
- **BrandedContentService**: Branded content integration
- **OrganicGrowthAutomationService**: Growth automation
- **ResourceLivingBrandQA**: Brand validation logic

## Audit Checklist

### Backend Setup
- [ ] Create Python venv
- [ ] Install pip dependencies
- [ ] Verify SQLite database accessibility
- [ ] Check .env configuration (if needed)

### Backend Verification
- [ ] Run backend main: `python -m backend.main`
- [ ] Verify FastAPI docs available: http://localhost:8000/docs
- [ ] Test QA gate endpoint (specific route TBD)
- [ ] Check SQLite adsets.updated_at issue (if time)
- [ ] Verify Resource Living creative registry
- [ ] Review test suite: `pytest tests/`

### Frontend Setup
- [ ] Navigate to frontend/
- [ ] npm install
- [ ] npm run dev

### Frontend Verification
- [ ] Dev server starts (port TBD)
- [ ] No build errors
- [ ] Dashboard loads
- [ ] Resource Living components render

### Integration Testing
- [ ] QA gate API responds
- [ ] Brand validation works
- [ ] Data flows between services
- [ ] No critical errors in logs

## Known Issues to Investigate

1. **SQLite adsets.updated_at** - Possible schema issue
2. **Social publisher stash** - Blocked by Meta permissions (do not apply)
3. **Package modifications** - Understand scope of changes

## Stashes to Preserve

**Do NOT apply these without verification:**
```
stash@{0}: WIP PR-004 social publisher (blocked by Meta permissions)
stash@{1}: local-work-before-mcp
```

## Time Estimate

- Backend setup: 10-15 minutes
- Frontend setup: 10-15 minutes  
- Testing and verification: 30-45 minutes
- **Total: 50-75 minutes**

## Success Criteria

✅ Backend starts without errors  
✅ Frontend dev server starts without errors  
✅ QA gate endpoint responds  
✅ No critical TypeScript errors in frontend  
✅ No critical Python errors in backend  
✅ Resource Living integrations functional  

## Recommendation for Next Session

1. **Start backend setup** first (Python dependencies)
2. **Parallel:** Setup frontend if time permits
3. **Test both** through their respective dev interfaces
4. **Document** any errors found
5. **Avoid** running tests unless framework is understood

## Files to Monitor

Critical files with recent changes:
- `backend/ai/services/content_quality_gate.py`
- `backend/ai/resource_living_creative_registry.py`
- `backend/ai/services/organic_growth_automation_service.py`
- `frontend/` (all React components)

## Resources

- FastAPI docs: http://localhost:8000/docs (when running)
- SQLite database: `marketing_ai.db` (local)
- Meta Graph API: Requires credentials

---

**Next Session Action:** Execute backend setup and verification per checklist above.
