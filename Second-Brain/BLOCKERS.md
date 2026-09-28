---
title: Blockers
type: Issue Tracking
created: 2026-09-22
---

# 🚫 Known Blockers

External dependencies and technical blockers that affect project execution.

## No Critical Blockers for TASK-001

PROS360ERA can start immediately. No external dependencies required for basic verification.

## Potential External Blockers

### Meta Graph API Permissions
**Project:** Marketing-AI-Platform  
**Issue:** Social publisher feature blocked by Meta permissions  
**Status:** Stashed (not part of current task)  
**Action:** Do not apply stash without Meta permissions restored  
**Workaround:** Test QA gate without social publisher

### Supabase Credentials
**Projects:** PROS360ERA, BELONG  
**Issue:** Projects may require .env with Supabase keys  
**Status:** Check if .env exists locally  
**Action:** Preserve existing .env; do not expose or modify  

### SQLite Schema Issue
**Project:** Marketing-AI-Platform  
**Issue:** adsets.updated_at table issue noted  
**Status:** Unknown severity  
**Action:** Investigate during TASK-002

## No Blockers for Current Session

All projects can be audited and tested without external authorization.

---

Last Updated: 2026-09-22
