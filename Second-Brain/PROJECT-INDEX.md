---
title: Project Index
type: Reference
created: 2026-09-22
updated: 2026-09-22
---

# 📋 Project Index

Comprehensive listing of all projects in the AI-Projects workspace.

## 1️⃣ PROS360ERA

**Status:** Active / In Progress  
**Priority:** High  
**Type:** Next.js Frontend + Supabase Backend  

**Repository:** https://github.com/mauricioyepesstudio/pros360era.git  
**Local Path:** `C:\Users\graphics1\pros360era` (junction in workspace)  
**Active Branch:** `feat/evolusa-migration`  
**Main Branch:** `main`  

**Description:**  
PROS360ERA is a multiservices platform for immigrants, freelancers, and small business owners. Provides LLC/Corporation formation, EIN/ITIN/DBA, licenses, taxes, accounting, notary services, insurance, branding, web design, marketing, social media, and advertising.

**Key Features:**
- Spanish-language support
- Services catalog (LLC, EIN, ITIN, DBA, Licenses, Taxes, Notary, Insurance, Branding, Web, Marketing)
- Dashboard for service management
- Professional application pages (Evolussa migration)
- Plan de Crédito integration
- WhatsApp integration
- CTA: "Agenda Gratis"

**Git State:**
- ✓ Clean (no local modifications)
- Current commit: `784c94c` feat(evolusa): add public professional application page
- No stashes

**Recent Work:**
- Public professional application page added
- NOTARY included in regulated-services disclaimer
- Plan de Crédito linked from dashboard

**Related Notes:** EVOLUSA branding project associated

---

## 2️⃣ MARKETING-AI-PLATFORM

**Status:** Active / Working  
**Priority:** High  
**Type:** Hybrid (Python FastAPI Backend + Next.js React Frontend)  

**Repository:** https://github.com/mauricioyepesstudio/marketing-ai-platform.git  
**Local Path:** `C:\Users\graphics1\Desktop\marketing-ai-platform` (junction)  
**Active Branch:** `work/resource-living-live-audit-rescue`  
**Main Branch:** `main`  

**Description:**  
AI-powered marketing campaign management platform. Integrates with Meta Ads, manages campaigns, ad sets, ads, creatives, analytics. Includes Resource Living brand QA gates and growth automation.

**Technology Stack:**
- Backend: Python, FastAPI, SQLAlchemy, SQLite
- Frontend: Next.js, React, Tailwind, Radix UI, Recharts, Axios
- Services: Meta Graph API integration
- MCP Server: Custom MCP adapters

**Key Components:**
- Dashboard with campaign management
- Meta Ads integration (campaigns, ad sets, ads)
- Creative management
- Branded content service
- Growth automation
- Content quality gates
- Organic growth automation
- Resource Living creative registry
- Media/image management

**Git State:**
- ⚠️ Active changes (40+ modified files in backend and frontend)
- ⚠️ 2 stashes with previous work:
  - `stash@{0}`: WIP PR-004 social publisher (blocked by Meta permissions)
  - `stash@{1}`: local-work-before-mcp
- Current branch: `work/resource-living-live-audit-rescue`

**Known Issues:**
- ⚠️ SQLite related to adsets.updated_at (reported problem)
- Changes in: resource_living_creative_registry.py, content_quality_gate.py, organic_growth_automation_service.py
- __pycache__ files modified

**Related Notes:** Resource Living is client case study; C2 Multimedia connection

---

## 3️⃣ BELONG

**Status:** Paused / Read-Only  
**Priority:** Medium  
**Type:** Next.js Frontend + Supabase Backend  

**Repository:** (No remote configured)  
**Local Path:** `C:\Users\graphics1\Documents\Codex/..../belong-v25` (historical location)  
**Junction Path:** `C:\Users\graphics1\AI-Projects\belong-v25-candidate`  
**Active Branch:** `master`  
**Main Branch:** `master`  

**Description:**  
BELONG is a social impact platform for human connection and collaboration. Users discover projects, join initiatives, take responsibility, collaborate, and contribute work that gets reviewed and approved by owners.

**Key Concepts:**
- Project discovery and joining
- Responsibility assignment
- Collaboration workflows
- Work submission to review
- Owner approval process
- Task completion
- Impact analytics and tracking
- Contributor/owner roles

**Architecture:**
- Framework: Next.js (app directory)
- Database: Supabase
- Authentication: Supabase Auth with roles
- Key Engines: opportunity-screen, matchers
- Systems: Multiple (lib/systems structure)
- Database: Supabase migrations in place

**Git State:**
- ⚠️ Ownership issue (resolved with safe.directory config)
- 3 local modifications:
  - engines/opportunity/components/opportunity-screen.tsx
  - engines/opportunity/matchers.ts
  - lib/actions/connections.ts
- Only 1 commit in history: `89bb0af` baseline
- No remote configured (HISTORICAL CANDIDATE)

**Status Note:** This is marked as read-only during audit phase. Verify before modification.

**Related Notes:** Different from current BELONG implementation if one exists elsewhere

---

## 4️⃣ MAURICIO-PORTFOLIO

**Status:** Stable / In Maintenance  
**Priority:** Medium  
**Type:** Next.js Portfolio Website  

**Repository:** https://github.com/mauricioyepesstudio/mauricio-portfolio.git  
**Local Path:** `C:\Users\graphics1\Desktop\mauricio-portfolio` (junction)  
**Active Branch:** `main`  
**Main Branch:** `main`  

**Description:**  
Professional portfolio for Mauricio Yepes showcasing design, branding, marketing, photography, advertising (Meta Ads, Google Ads), email marketing, landing pages, web design, automations, and content creation.

**Services Showcased:**
- Graphic design
- Branding
- Marketing strategies
- Photography
- Digital advertising (Meta/Google)
- Email marketing
- Landing pages
- Web design
- Marketing automations
- Content creation

**Key Requirements:**
- Use "Mauricio Yepes" name
- Professional presentation
- Case studies with results
- White logos that turn yellow on interaction
- Clear organization of work and services

**Git State:**
- ⚠️ Asset management state (many project files deleted)
- Large portfolio project deletions detected
- Latest commit: `50d19b7` Polish site copy and case-study storytelling

**Related Notes:** Can serve as case study documentation for other work

---

## 5️⃣ REALGROUP-WEBSITE

**Status:** Active / Managing Assets  
**Priority:** Medium  
**Type:** Next.js Website  

**Repository:** https://github.com/mauricioyepesstudio/mauricioyepes.git  
**Local Path:** `C:\Users\graphics1\Desktop\realgroup-website` (junction)  
**Active Branch:** `master`  
**Main Branch:** `master`  

**Description:**  
RealGroup website for home improvement services. Lead generation and advertising for services like pools, roofing, kitchens, bathrooms, impact windows, AC/HVAC, plumbing, closets, blinds, painting, pavers, landscaping, shower doors.

**Services:**
- Pool construction
- Roofing
- Kitchen remodeling
- Bathroom remodeling
- Impact windows and doors
- AC/HVAC services
- Plumbing
- Closets
- Blinds
- Painting
- Pavers
- Landscaping
- Shower doors

**Git State:**
- ⚠️ Asset reorganization in progress:
  - 200+ image files deleted from assets/projects/
  - 70+ video files deleted from assets/videos/
  - Logo files being reorganized in assets/logos/
  - package.json and package-lock.json modified
- Current branch: `master`
- Latest commit: `3af1195` Initial portfolio

**Related Notes:** Resource Living case study; C2 Multimedia connection

---

## 6️⃣ AGENCY-AGENTS

**Status:** External Reference  
**Priority:** Low  
**Type:** Agent Repository (Not a runnable application)  

**Repository:** https://github.com/msitarzewski/agency-agents.git  
**Local Path:** `C:\Users\graphics1\agency-agents` (junction)  
**Active Branch:** `main`  

**Description:**  
Repository containing agent definitions and examples. Includes various specialized agent types for different domains: academic, design, engineering, finance, game development, healthcare, marketing, paid media, product, sales, security, and more.

**Structure:**  
Multiple subdirectories organizing agents by specialization

**Git State:**
- ⚠️ Local modifications:
  - .gitignore modified
  - Claude-flow directories added
  - .claude/ configuration added
  - CLAUDE.md file
  - ruvector.db file
- Latest commit: `ebe9c99` Move Economy Designer to proper section

**Related Notes:** Used as reference for agent patterns; not a primary project

---

## 📊 Project Comparison

| Aspect | PROS360ERA | BELONG | Marketing-AI | Portfolio | RealGroup |
|--------|------------|--------|--------------|-----------|-----------|
| **Type** | Next.js+DB | Next.js+DB | FastAPI+React | Next.js | Next.js |
| **Maturity** | MVP | Candidate | Beta | Stable | Active |
| **Git Status** | Clean | Modified | Modified | Modified | Modified |
| **Remote** | Yes | No | Yes | Yes | Yes |
| **Priority** | High | Medium | High | Medium | Medium |
| **Runnable** | Yes | Probably | Yes | Yes | Yes |

---

## 🔗 Cross-Project References

- **Resource Living**: Featured in PROS360ERA services, Marketing-AI Platform case, RealGroup website services
- **EVOLUSA**: Branding for PROS360ERA multiservices platform
- **Mauricio Portfolio**: Can showcase all other project work as case studies
- **Agency-Agents**: Reference for AI/Claude agent patterns

---

Last Updated: 2026-09-22  
Audit Completed: 2026-09-22
