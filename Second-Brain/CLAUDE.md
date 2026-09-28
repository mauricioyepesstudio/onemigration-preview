---
title: Claude Code Operating Rules for AI-Projects
type: Persistent Instructions
created: 2026-09-22
updated: 2026-09-22
scope: All Sessions
---

# 🎯 Claude Code Operating Rules

Persistent instructions for Claude sessions working on AI-Projects workspace.

---

## ENTRY PROTOCOL FOR EVERY SESSION

**Before starting any work:**

1. ✅ Read `Second-Brain/HOME.md` (orientation)
2. ✅ Read `Second-Brain/PROJECT-INDEX.md` (current state)
3. ✅ Read `Second-Brain/MASTER-ROADMAP.md` (priorities)
4. ✅ Read `Second-Brain/SESSION-HANDOFF.md` (what to do next)
5. ✅ Run Git status check on all repositories
6. ✅ Review `BLOCKERS.md` for external issues
7. ✅ Review `NEXT-ACTIONS.md` for immediate queue

**Then:**
8. Identify the work category (development, design, marketing, deployment, etc.)
9. Consult `Second-Brain/09-Technical/SKILL-ROUTING.md` to select the correct tool
10. Verify tool is available in `TOOL-REGISTRY.md`
11. Use ONLY the recommended tool
12. Record all tool usage in `ACTIVITY-LOG.md`

---

## TOOL SELECTION MANDATORY RULE

**Always consult SKILL-ROUTING.md before selecting a tool.**

**Never:**
- Invent alternative tools
- Use tools outside their documented scope
- Assume a tool is available without checking TOOL-REGISTRY.md
- Claim an unavailable tool was used

**If recommended tool is unavailable:**
1. Check SKILL-ROUTING.md for documented fallback
2. Use fallback if available
3. Record the fallback tool used
4. Note why primary tool was unavailable

---

## SAFETY BASELINE RULES

### Git Operations

✅ **DO:**
- Check `git status` before any changes
- Preserve all uncommitted work
- Create new commits (never amend without approval)
- Document changes in commit messages

❌ **NEVER:**
- Use `git reset --hard` without approval
- Force push
- Discard local changes
- Merge branches without review
- Push to main without approval

### File Operations

✅ **DO:**
- Use Edit tool for text replacement
- Use Read tool to inspect before modifying
- Preserve existing .env files
- Create .env.example templates

❌ **NEVER:**
- Delete files without approval
- Expose secrets or credentials
- Commit .env files
- Overwrite local work

### External Operations

✅ **DO:**
- Request approval before push/merge/deploy
- Test locally first
- Review changes before committing
- Get owner confirmation for restricted actions

❌ **NEVER:**
- Deploy without approval
- Activate advertising without approval
- Send external communications without approval
- Modify production data without approval
- Spend money without approval

---

## CANONICAL REPOSITORY STATUS

### Verified Canonical Repositories

1. **PROS360ERA** → https://github.com/mauricioyepesstudio/pros360era.git
   - Location: C:\Users\graphics1\pros360era
   - Status: Ready for operations
   - Current: feat/evolusa-migration branch

2. **MARKETING-AI-PLATFORM** → https://github.com/mauricioyepesstudio/marketing-ai-platform.git
   - Location: C:\Users\graphics1\Desktop\marketing-ai-platform
   - Status: Active development, preserve changes
   - Current: work/resource-living-live-audit-rescue branch

3. **MAURICIO-PORTFOLIO** → https://github.com/mauricioyepesstudio/mauricio-portfolio.git
   - Location: C:\Users\graphics1\Desktop\mauricio-portfolio
   - Status: Asset reorganization in progress

4. **REALGROUP-WEBSITE** → https://github.com/mauricioyepesstudio/mauricioyepes.git
   - Location: C:\Users\graphics1\Desktop\realgroup-website
   - Status: Asset sync issues require review

5. **AGENCY-AGENTS** → https://github.com/msitarzewski/agency-agents.git
   - Location: C:\Users\graphics1\agency-agents
   - Status: External reference, local changes not pushed

### Candidate Repository Status

- **BELONG** (belong-v25-candidate)
  - Status: UNRESOLVED (historical candidate, no remote)
  - Action: Read-only until verified
  - Location: Junction to historical Codex path

---

## TECHNICAL REGISTRIES TO CONSULT

Before starting different work types:

| Work Type | Consult | Why |
|-----------|---------|-----|
| Any development | SKILL-ROUTING.md | Ensures correct tool selected |
| Tool unavailable | TOOL-REGISTRY.md | Find alternatives |
| MCP or API work | MCP-REGISTRY.md | Understand authentication needs |
| Need new agent | AGENT-REGISTRY.md | Verify agent type available |
| Automation needed | AUTOMATION-REGISTRY.md | Check before proposing |

---

## CREDENTIAL & SECRET POLICY

### Never Display

- API keys
- OAuth tokens
- Database passwords
- Service account files
- Private keys
- Browser cookies/sessions

### Safe to Display

- Service names (Supabase, Vercel, etc.)
- Field names and schemas
- Code structure
- Error messages
- Configuration structure (without values)

### When Credentials Needed

1. Note that credentials required
2. Specify which file/service
3. Request owner approval
4. Never print actual values
5. Use environment variables or secure config

---

## ACTIVITY LOGGING

**Every session must update ACTIVITY-LOG.md:**

- Date and time
- Work completed
- Files modified
- Tools used
- Tests run and results
- Blockers encountered
- Decisions made
- Next immediate action

**At session end:**

- Update SESSION-HANDOFF.md
- List uncommitted changes
- Note any approvals needed
- Specify exact next action

---

## PROJECT-SPECIFIC NOTES

### PROS360ERA
- Branch: feat/evolusa-migration
- Use npm for dependencies
- Test with dev server before building
- Supabase might need .env credentials
- Recommendation: Ready for merge/deploy

### MARKETING-AI-PLATFORM
- Branch: work/resource-living-live-audit-rescue
- Active development: preserve all changes
- 40+ modified files (do not discard)
- Stashes: 2 active (PR-004 and local-work-before-mcp)
- Use Python for backend, npm for frontend
- Windsor.ai integration for Meta Ads
- Resource Living case study

### BELONG
- Status: CANDIDATE (read-only)
- No remote configured (unresolved)
- Do not modify until canonical status confirmed
- 3 local files modified (preserve)

### Mauricio-Portfolio
- Assets being reorganized
- Review deletions before commit
- Verify portfolio renders without broken images

### RealGroup-Website
- Asset sync issues: 200+ images, 70+ videos deleted
- Investigate before pushing
- Verify website renders

---

## TROUBLESHOOTING & ESCALATION

**If blocked:**
1. Document the exact blocker
2. Check BLOCKERS.md for known issues
3. Attempt documented workaround
4. Update SESSION-HANDOFF.md with blocker
5. Request owner clarification/approval

**If security issue found:**
1. Stop work immediately
2. Document finding (file paths, no values)
3. Do not commit suspicious code
4. Request owner decision

**If tool unavailable:**
1. Check TOOL-REGISTRY.md
2. Use documented fallback
3. Record tool unavailability
4. Continue with alternative

---

## RULES FOR CONTINUATION BETWEEN MACHINES

(Implemented in PHASE 5)

- Use workspace.local.json for machine-specific paths
- Never hard-code C:\Users\graphics1 in scripts
- Use AI_PROJECTS_ROOT environment variable
- Check sync-health.ps1 before starting
- Only one automation leader at a time
- Preserve session context in SESSION-HANDOFF.md

---

## APPROVAL HIERARCHY

### No Approval Needed

- Local code improvements
- Tests and documentation
- Local commits with verified work
- Read-only inspections
- Planning and research

### Request Owner Approval

- Any push to repository
- Any merge to main
- Any deployment
- Any paid services
- Any advertising activation
- Any external communications
- Database schema changes (production)
- Authentication/permission changes
- Content publication

---

## PERSISTENCE & MEMORY

**This CLAUDE.md is persistent.** 

Across all future sessions in this workspace:
- These rules apply
- SKILL-ROUTING.md is authoritative
- Second Brain is the source of truth
- SESSION-HANDOFF.md carries context forward

---

**Status:** Operating Rules Active ✓

Last Updated: 2026-09-22
