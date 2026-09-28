---
title: Skill Routing Matrix
type: Operational Guide
created: 2026-09-22
updated: 2026-09-22
status: Phase 2 Audit Complete
---

# 🛣️ Skill Routing Matrix

Decision matrix for selecting the correct verified tool for every type of work across all projects.

---

## HOW TO USE THIS GUIDE

**Every session:**
1. Identify the work category (below)
2. Find the corresponding recommended tool
3. Verify tool is available in TOOL-REGISTRY.md
4. Use ONLY the recommended tool (don't invent alternatives)
5. Record tool usage in ACTIVITY-LOG.md

**Key Rule:** If a tool is unavailable, use the safe alternative listed. Never claim an unavailable tool was used.

---

## NEXT.JS AND REACT DEVELOPMENT

### Category: Next.js Setup & Dependencies

**Tasks:** npm install, dependency management, version conflicts  
**Recommended Tool:** `bash` (npm command)  
**Command:** `npm install` in project directory  
**Verification:** Package-lock.json updated, no peer warnings  
**Fallback:** None (npm is required)  

### Category: Next.js Dev Server

**Tasks:** Start local dev server, test pages, hot reload  
**Recommended Tool:** `bash` (npm run dev) + Built-in Browser  
**Command:** `npm run dev` then navigate to localhost:3000  
**Verification:** Pages load, network tab clean, no console errors  
**Fallback:** None (required for testing)  

### Category: Next.js Build & Optimization

**Tasks:** Production build, bundle analysis, build errors  
**Recommended Tool:** `bash` (npm run build)  
**Command:** `npm run build` then review output  
**Verification:** Build completes, no TypeScript errors, page count correct  
**Fallback:** None (required for deployment)  

### Category: Next.js Linting & Type Checking

**Tasks:** Code quality checks, type safety, ESLint rules  
**Recommended Tool:** `bash` (npm run lint) or `code-review` skill  
**Commands:** 
- Linting: `npm run lint`
- Type check: `npm run typecheck` (if available)
- Quality review: `Skill(code-review)` for comprehensive feedback

**Verification:** No errors/warnings, or documented acceptable warnings  
**Fallback:** Read ESLint config if need to understand rules  

### Category: React Component Development

**Tasks:** Create/modify components, state management, hooks  
**Recommended Tool:** `Edit` tool for file changes + `code-review` skill for QA  
**Approach:**
1. Use Edit tool to modify component files
2. Test changes with dev server
3. Use code-review skill for quality check

**Verification:** Dev server runs, component renders, tests pass  
**Fallback:** Manual component testing in browser  

### Category: Styling & CSS

**Tasks:** Tailwind updates, CSS modules, responsive design  
**Recommended Tool:** `ui-styling` skill + Manual browser testing  
**Approach:**
1. Use ui-styling skill for design guidance
2. Make CSS changes with Edit tool
3. Verify in browser with dev server

**Verification:** Responsive, accessible, no layout shift  
**Fallback:** Manual CSS debugging in browser dev tools  

### Category: Testing (React/Next.js)

**Tasks:** Unit tests, integration tests, E2E tests  
**Recommended Tool:** `bash` (npm run test, npm run test:e2e) + `engineering:testing-strategy` skill  
**Approach:**
1. Plan tests with testing-strategy skill
2. Write/modify tests with Edit tool
3. Run tests with bash
4. Review coverage

**Verification:** Tests pass, coverage meets requirements  
**Fallback:** Manual browser testing  

---

## FASTAPI AND PYTHON DEVELOPMENT

### Category: Python Environment Setup

**Tasks:** venv creation, pip install, dependency conflicts  
**Recommended Tool:** `bash` (python -m venv, pip install -r requirements.txt)  
**Command:** Standard Python venv setup  
**Verification:** venv activated, dependencies installed, no conflicts  
**Fallback:** None (required for Python projects)  

### Category: FastAPI Server Startup

**Tasks:** Start backend server, API testing, route verification  
**Recommended Tool:** `bash` (python -m backend.main) + Built-in Browser  
**Command:** Backend-specific startup command  
**Verification:** Server starts, logs show ready, health check passes  
**Fallback:** Manual debugging via logs  

### Category: Python Code Quality

**Tasks:** Type checking, linting, test execution  
**Recommended Tool:** `bash` (python -m pytest, mypy, black) + `code-review` skill  
**Approach:**
1. Run lint/type-check commands in bash
2. Use code-review skill for comprehensive feedback
3. Review and apply suggestions

**Verification:** No blocking errors, tests pass  
**Fallback:** Read error output for manual fixes  

### Category: FastAPI Endpoints & Routes

**Tasks:** Add/modify API routes, request/response models, validation  
**Recommended Tool:** `Edit` tool for code changes + `code-review` skill  
**Approach:**
1. Use Edit tool to modify API files
2. Test with dev server or manual curl/browser requests
3. Use code-review skill for quality check

**Verification:** Endpoint responds correctly, validation works  
**Fallback:** Manual API testing via curl or browser  

### Category: Database (Python/SQLAlchemy)

**Tasks:** ORM queries, model definitions, migrations  
**Recommended Tool:** `Edit` tool for code + `bash` for migrations + Supabase MCP (if needed)  
**Approach:**
1. Use Edit tool to modify models/queries
2. Run migrations with bash (if needed)
3. Test queries with dev server
4. Only use Supabase MCP if schema operations needed (requires auth)

**Verification:** Queries return expected data, no N+1 problems  
**Fallback:** Manual testing with database client  

### Category: Python Testing

**Tasks:** Unit tests, integration tests, fixtures  
**Recommended Tool:** `bash` (pytest) + `engineering:testing-strategy` skill  
**Approach:**
1. Plan tests with testing-strategy skill
2. Write tests with Edit tool
3. Run with bash: `pytest`

**Verification:** Tests pass, coverage adequate  
**Fallback:** Manual testing  

---

## SUPABASE DATABASE OPERATIONS

### Category: Schema Inspection & Documentation

**Tasks:** Understand tables, columns, relationships  
**Recommended Tool:** Read project schema docs + Grep for migrations  
**Approach:**
1. Read supabase/migrations files
2. Use Grep to search table names
3. Document structure locally first

**Verification:** Schema documented in Second Brain  
**Fallback:** Manual SQL queries (read-only)  

### Category: Database Migrations

**Tasks:** Add tables, columns, constraints  
**Recommended Tool:** `Supabase MCP` (execute_sql, list_tables, list_migrations)  
**Note:** Requires Supabase project authentication (not available this session)  
**Verification:** Migration applies cleanly, no data loss  
**Requirement:** Owner approval before push to main  

### Category: Read-Only Database Checks

**Tasks:** Verify data, row counts, query results  
**Recommended Tool:** `Supabase MCP` (execute_sql with SELECT only)  
**Note:** Requires Supabase authentication  
**Safety:** Read-only only. Never UPDATE/DELETE without approval.  

### Category: Local Supabase Setup

**Tasks:** Set up local Supabase, migrations, seeding  
**Recommended Tool:** `bash` (supabase CLI if installed) + Documentation  
**Verification:** Local database runs, migrations pass  
**Fallback:** Use published Supabase project (staging/prod)  

---

## META ADS INTEGRATION

### Category: Meta Graph API Research

**Tasks:** Understand API version, fields, permissions  
**Recommended Tool:** Firecrawl (web search) + code-review for Meta API expertise  
**Approach:**
1. Use Firecrawl to search Meta documentation
2. Review current API code
3. Consult code-review skill for best practices

**Verification:** Understanding documented, API version current  
**Fallback:** Read existing code and comments  

### Category: Meta Campaign Data Sync

**Tasks:** Fetch campaigns, ads, metadata from Meta  
**Recommended Tool:** Windsor.ai (Meta connector) + Marketing-AI-Platform backend  
**Note:** Requires Meta Graph API credentials (may exist in project)  
**Verification:** Data syncs correctly, no duplicates  
**Requirement:** Test in dev first, production approval needed  

### Category: Creative Management

**Tasks:** Upload creatives, manage assets, track performance  
**Recommended Tool:** Windsor.ai (Meta connector) for read/write  
**Note:** Resource Living case study integration  
**Safety:** Review changes before pushing to production Meta account  
**Requirement:** Owner approval for production campaigns  

### Category: QA Gate & Validation

**Tasks:** Content quality checks, compliance review  
**Recommended Tool:** Marketing-AI-Platform `content_quality_gate.py` (backend service)  
**Approach:**
1. Run QA gate via backend API
2. Review validation results
3. Iterate on creative if needed

**Verification:** Quality scores documented, compliance verified  
**Fallback:** Manual content review  

---

## GOOGLE ADS

### Category: Google Ads Research & Documentation

**Tasks:** Understand API, campaigns, metrics  
**Recommended Tool:** Firecrawl (web search) + Google Ads documentation  
**Approach:**
1. Search current Google Ads API docs
2. Review any existing integrations
3. Document findings

**Verification:** Research documented, API understood  
**Fallback:** Read project code comments  

### Category: Google Ads Data Integration

**Tasks:** Sync campaigns, performance, costs  
**Recommended Tool:** Windsor.ai (Google Ads connector)  
**Note:** Requires Google Ads account credentials  
**Verification:** Data accurate, sync working  
**Requirement:** Test in dev, approval for production  

---

## CRM & LEAD AUTOMATION

### Category: Lead Flow Understanding

**Tasks:** Map lead sources, conversion funnels, automation flows  
**Recommended Tool:** PROS360ERA & RealGroup project docs + Firecrawl for competitor research  
**Approach:**
1. Document existing lead flow
2. Research industry best practices
3. Identify optimization opportunities

**Verification:** Lead flow documented, funnels mapped  
**Fallback:** Manual documentation review  

### Category: Lead Capture Forms

**Tasks:** Create/modify lead forms, validation, submission  
**Recommended Tool:** `Edit` tool (form components) + `code-review` skill  
**Approach:**
1. Modify form components with Edit
2. Test in dev server
3. Verify data collection works

**Verification:** Forms submit, data captured correctly  
**Fallback:** Manual form testing  

### Category: CRM Integration

**Tasks:** Connect leads to CRM, automation, scoring  
**Recommended Tool:** Windsor.ai (available CRM connectors) or direct API integration  
**Note:** Depends on which CRM (HubSpot, Salesforce, GoHighLevel, etc.)  
**Safety:** Test with test data first  
**Requirement:** Owner approval before production activation  

---

## WORDPRESS & WOOCOMMERCE

**Status:** No WordPress projects identified in current workspace  
**Routing:** If WordPress project added, use:
- WP-specific tools/plugins (to be configured)
- Firecrawl for WP theme/plugin research
- code-review for custom PHP code

---

## BRANDING & GRAPHIC DESIGN

### Category: Brand Guidelines & Strategy

**Tasks:** Define brand voice, visual identity, style guide  
**Recommended Tool:** `brand` skill + `marketing:brand-review` skill  
**Approach:**
1. Use brand skill to establish guidelines
2. Use brand-review skill for validation
3. Document in Second Brain

**Verification:** Brand guide created, consistent across projects  
**Fallback:** Manual documentation  

### Category: Logo & Visual Design

**Tasks:** Create/modify logos, icons, graphics  
**Recommended Tool:** Kling AI (image generation) + `ui-ux-pro-max` or `design` skill  
**Note:** Kling requires credits  
**Approach:**
1. Define design brief
2. Use Kling for image generation
3. Review and iterate with design skill

**Verification:** Designs match brand, client approved  
**Fallback:** Use existing design templates  

### Category: Design System Implementation

**Tasks:** Component library, CSS variables, token system  
**Recommended Tool:** `design-system` skill + `ui-styling` skill + Edit tool  
**Approach:**
1. Plan system with design-system skill
2. Implement with Edit tool
3. Style with ui-styling skill

**Verification:** Components reusable, consistent  
**Fallback:** Manual component documentation  

---

## IMAGE GENERATION

### Category: AI Image Generation

**Tasks:** Generate images for marketing, product pages, creative  
**Recommended Tool:** **Kling AI** (text_to_image, image_to_image)  
**Alternative:** Firefly (via Adobe connector if available)  
**Note:** Kling requires authentication + credits  
**Safety:** Review for brand compliance before publishing  
**Approach:**
1. Write detailed prompt
2. Call Kling tool
3. Review result, iterate if needed
4. Approve before use

**Verification:** Images match brief, brand-compliant  
**Cost:** Credit-based (Kling)  

---

## VIDEO GENERATION & EDITING

### Category: Video Generation

**Tasks:** Create marketing videos, ads, explainers  
**Recommended Tool:** Kling AI (text_to_video) or HeyGen (programmatic video)  
**Note:** Both require credits/subscription  
**Approach:**
1. Define video brief and storyboard
2. Use Kling or HeyGen to generate
3. Review and iterate

**Verification:** Video matches brief, brand-compliant  
**Cost:** Credit-based  

### Category: Video Editing & Post-Production

**Tasks:** Edit existing video, trim, effects, captions  
**Recommended Tool:** Descript (text-based video editing) or HeyGen (programmatic)  
**Approach:**
1. Import video to Descript
2. Edit by editing transcript (Descript) or use HeyGen
3. Export finished video

**Verification:** Video ready for platform  
**Fallback:** Use existing video assets  

### Category: Video Hosting & Optimization

**Tasks:** Upload, optimize for platform (YouTube, TikTok, Meta)  
**Recommended Tool:** Windsor.ai (Meta/TikTok) or manual upload  
**Verification:** Video plays correctly on target platform  

---

## TESTING & BROWSER VERIFICATION

### Category: Manual Browser Testing

**Tasks:** Test UI, forms, interactions, cross-browser  
**Recommended Tool:** **Built-in Browser** (mcp__Claude_Browser__*)  
**Approach:**
1. Start dev server with bash
2. Navigate to localhost in browser
3. Test flows, validate rendering
4. Take screenshots if needed

**Verification:** All flows work, no console errors  
**Fallback:** Manual testing on actual device  

### Category: Automated E2E Testing

**Tasks:** Create/run browser tests (Playwright, Cypress)  
**Recommended Tool:** `bash` (run tests) + `engineering:testing-strategy` skill  
**Approach:**
1. Plan tests with testing-strategy
2. Write tests with Edit tool
3. Run with bash
4. Review results

**Verification:** Tests pass, coverage adequate  
**Fallback:** Manual testing  

### Category: API Testing

**Tasks:** Test endpoints, request/response validation  
**Recommended Tool:** **Built-in Browser** (for simple tests) + bash (for complex tests)  
**Approach:**
1. Start backend server
2. Use browser Network tab or curl/bash for requests
3. Verify responses

**Verification:** API returns correct data, status codes  
**Fallback:** Postman or manual curl  

### Category: Performance Testing

**Tasks:** Load testing, performance monitoring  
**Recommended Tool:** Browser DevTools (built-in) + bash (if needed)  
**Approach:**
1. Use browser Performance tab
2. Check metrics (FCP, LCP, CLS)
3. Run Lighthouse audit

**Verification:** Performance meets targets  
**Fallback:** Manual monitoring  

---

## DEPLOYMENT & HOSTING

### Category: Vercel Deployment

**Tasks:** Deploy Next.js projects, manage environment, rollback  
**Recommended Tool:** **Vercel MCP** (create_deployment, get_deployment, manage environment variables)  
**Note:** Requires Vercel project + API token (not available this session)  
**Safety:** Test in preview first, production approval needed  
**Requirement:** Owner approval for production push  

### Category: Supabase Database Deployment

**Tasks:** Run migrations on production, backup, schema changes  
**Recommended Tool:** **Supabase MCP**  
**Note:** Requires Supabase project auth  
**Safety:** Test migrations locally first  
**Requirement:** Owner approval for destructive operations  

### Category: API/Backend Deployment

**Tasks:** Deploy FastAPI backend, manage server  
**Recommended Tool:** Project-specific deployment (documented in project)  
**Approach:**
1. Review deployment instructions in project
2. Prepare changes for deployment
3. Request owner approval
4. Execute deployment

**Verification:** Server running, endpoints responding  
**Fallback:** Manual deployment steps  

---

## GIT & REPOSITORY MANAGEMENT

### Category: Git Status & Inspection

**Tasks:** Check branch, status, commits, remotes  
**Recommended Tool:** `bash` (git status, git log, git branch)  
**Approach:**
1. Run git status to see current state
2. Review commits with git log
3. Check remotes with git remote -v

**Verification:** All repos in expected state  
**Fallback:** None (required)  

### Category: Git Workflow

**Tasks:** Create branch, commit, sync with main  
**Recommended Tool:** `bash` (git fetch, git checkout, git commit, git merge)  
**Safety:** Never force push, never reset without approval  
**Requirement:** Owner approval before push  

### Category: GitHub Operations

**Tasks:** Create PR, review code, merge, releases  
**Recommended Tool:** `bash` (gh CLI) or GitHub web interface  
**Safety:** Review changes before pushing  
**Requirement:** Owner approval for merge to main  

---

## DOCUMENTATION & KNOWLEDGE INGESTION

### Category: Technical Documentation

**Tasks:** Write API docs, architecture docs, guides  
**Recommended Tool:** `Edit` tool + `engineering:documentation` skill  
**Approach:**
1. Plan structure with documentation skill
2. Write content with Edit tool
3. Review for clarity

**Verification:** Documentation complete, accurate, current  
**Fallback:** Manual documentation  

### Category: Knowledge Base Research

**Tasks:** Learn codebase, understand architecture  
**Recommended Tool:** Agent (Explore type) + Grep + Read tools  
**Approach:**
1. Use Agent (Explore) to find relevant files
2. Use Read to understand code
3. Use Grep to find specific patterns
4. Document findings

**Verification:** Understanding documented in Second Brain  
**Fallback:** Manual code review  

### Category: External Knowledge Integration

**Tasks:** Research libraries, best practices, competitors  
**Recommended Tool:** **Firecrawl** (web + developer search)  
**Approach:**
1. Define research question
2. Use Firecrawl to search
3. Review results, cite sources
4. Document findings

**Verification:** Research complete, sources cited, date recorded  
**Fallback:** Manual web search  

---

## MARKETING ANALYSIS & PLANNING

### Category: Market Research

**Tasks:** Competitor analysis, trend research, opportunity identification  
**Recommended Tool:** **Firecrawl** (web search) + `marketing:campaign-plan` skill  
**Approach:**
1. Search competitor websites/strategies
2. Plan marketing approach with skill
3. Document findings and strategy

**Verification:** Research documented, opportunities identified  
**Fallback:** Manual research  

### Category: Content Planning & Creation

**Tasks:** Blog posts, social media, email campaigns  
**Recommended Tool:** `marketing:content-creation` or `marketing:draft-content` skills  
**Approach:**
1. Plan content calendar with skill
2. Draft content with Edit tool
3. Review and approve

**Verification:** Content ready for review, on-brand  
**Requirement:** Owner approval before publication  

### Category: Analytics & Performance Review

**Tasks:** Review campaign performance, conversion metrics, ROI  
**Recommended Tool:** `Windsor.ai` (platform connectors) + `dataviz` skill  
**Approach:**
1. Fetch data via Windsor.ai
2. Visualize with dataviz skill
3. Analyze trends and create report

**Verification:** Metrics accurate, insights actionable  
**Fallback:** Manual report creation  

### Category: Email Marketing

**Tasks:** Create email sequences, automation, segmentation  
**Recommended Tool:** `marketing:email-sequence` skill + Platform integration  
**Approach:**
1. Plan sequence with skill
2. Set up in platform (HubSpot, Klaviyo, etc.)
3. Test and deploy

**Verification:** Sequence works, conversions tracked  
**Fallback:** Manual email campaign  

---

## SECURITY REVIEWS

### Category: Code Security Audit

**Tasks:** Find vulnerabilities, assess risks, remediate  
**Recommended Tool:** `code-review` skill (with security focus) + Grep for sensitive patterns  
**Approach:**
1. Use code-review to identify issues
2. Use Grep to find sensitive patterns (.env, secrets, etc.)
3. Document findings with remediation

**Verification:** Vulnerabilities identified and fixed  
**Requirement:** Owner approval for security changes  

### Category: Dependency Security

**Tasks:** Check for vulnerable dependencies, update packages  
**Recommended Tool:** `bash` (npm audit, pip check) + Grep  
**Approach:**
1. Run security audit tools
2. Review results
3. Update where safe
4. Test changes

**Verification:** Vulnerabilities resolved, tests pass  
**Fallback:** Manual review  

### Category: Secret Detection

**Tasks:** Find exposed credentials, .env files, keys  
**Recommended Tool:** Grep (search for patterns) + Read (inspect files)  
**Safety:** Never print actual secrets, only report file paths  
**Approach:**
1. Use Grep to search for secret patterns
2. Report locations without values
3. Create .gitignore rules
4. Fix exposure

**Verification:** Secrets protected, .gitignore updated  

---

## SUMMARY TABLE

| Work Category | Primary Tool | Verification | Owner Approval |
|---------------|--------------|--------------|---|
| Next.js Dev | bash + browser | Runs locally | No |
| FastAPI Dev | bash + browser | API responds | No |
| Supabase | MCP or bash | Data correct | Yes (schema) |
| Meta Ads | Windsor.ai | Sync accurate | Yes (prod) |
| Google Ads | Windsor.ai | Sync accurate | Yes (prod) |
| Image Gen | Kling AI | Brand OK | Yes (publish) |
| Video Gen | Descript/Kling | Quality OK | Yes (publish) |
| Testing | bash + browser | Tests pass | No |
| Deployment | Vercel/Supabase MCP | Live | Yes (all) |
| Git | bash (gh CLI) | Clean | Yes (push) |
| Docs | Edit + skill | Complete | No |
| Research | Firecrawl | Sourced | No |
| Marketing | Windsor/Skills | Results track | Yes (campaigns) |
| Security | code-review + Grep | Fixed | Yes (prod) |

---

## INSTRUCTIONS FOR NEXT SESSION

Before starting any work:

1. **Identify the task category** in this document
2. **Check TOOL-REGISTRY.md** to verify the tool is available
3. **Use ONLY the recommended tool** — don't invent alternatives
4. **Record tool + result** in ACTIVITY-LOG.md
5. **If tool unavailable,** use the documented fallback
6. **If needing credentials,** request owner approval first

---

**Status:** PHASE 2 SKILL-ROUTING COMPLETE ✓

Last Updated: 2026-09-22
