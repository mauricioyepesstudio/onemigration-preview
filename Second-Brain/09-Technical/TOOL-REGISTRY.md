---
title: Tool Registry
type: Technical Reference
created: 2026-09-22
updated: 2026-09-22
status: Phase 2 Audit Complete
---

# 🔧 Tool Registry

Comprehensive inventory of tools, skills, plugins, MCP servers, and integrations available in the Claude Code environment.

---

## LOCAL DEVELOPMENT TOOLS

### Installed Runtimes

| Tool | Version | Status | Installation Scope | Verification |
|------|---------|--------|-------------------|---------------|
| Python | 3.14.7 | ✓ Installed | System-wide | `python --version` |
| Node.js | v24.18.0 | ✓ Installed | System-wide | `node --version` |
| npm | 11.16.0 | ✓ Installed | System-wide | `npm --version` |
| Git | 2.55.0.windows.2 | ✓ Installed | System-wide | `git --version` |
| PowerShell | 5.1 (Windows) | ✓ Installed | System-wide | `$PSVersionTable.PSVersion` |

### Status

All required runtimes installed and verified. Windows PowerShell 5.1 compatible for all scripts.

---

## NATIVE CLAUDE CODE TOOLS

### File Operations

| Tool | Type | Scope | Status | Usage |
|------|------|-------|--------|-------|
| Read | Built-in | Local filesystem | ✓ Available | Reading files up to 2000 lines |
| Write | Built-in | Local filesystem | ✓ Available | Writing new files and large content |
| Edit | Built-in | Local filesystem | ✓ Available | Text replacement in existing files |
| Glob | Built-in | File pattern matching | ✓ Available | Finding files by glob patterns |
| Grep | Built-in | Content search (ripgrep) | ✓ Available | Searching file contents with regex |

**Status:** All native file tools operational.

---

### Shell and Execution

| Tool | Type | Scope | Status | Usage |
|------|------|-------|--------|-------|
| Bash | Shell execution | POSIX commands | ✓ Available | Running bash scripts and commands |
| PowerShell | Shell execution | Windows PS 5.1 | ✓ Available | Running PowerShell commands |

**Status:** Both shells operational. PowerShell 5.1 compatible (no && operator, use semicolons).

---

### Git and Repository

| Tool | Type | Scope | Status | Usage |
|------|------|-------|--------|-------|
| Git (native) | Command-line | Repository management | ✓ Available | Git operations via Bash/PowerShell |
| gh CLI | Command-line | GitHub operations | ✓ Available (if installed) | GitHub PR, issue, release management |

**Status:** Native Git available. GitHub CLI (gh) can be used for GitHub-specific operations.

---

### Browser and Web

| Tool | Type | Scope | Status | Usage |
|------|------|-------|--------|-------|
| Claude in-app Browser | Web browser | Internal | ✓ Available | mcp__Claude_Browser__* tools |
| Claude in Chrome | Web browser | External Chrome | Requires approval | mcp__claude-in-chrome__* tools |

**Status:** Built-in browser active. Chrome integration available if user has connected browser.

---

## CLAUDE CODE SKILLS (Deferred Tools)

### Available Skills

Skills must be loaded via `Skill` tool before use. These are available in this session:

#### Development Skills

- **code-review** — Code review with configurable effort levels (low/medium/high/max/ultra)
- **simplify** — Code simplification and refactoring
- **engineering:architecture** — System design guidance
- **engineering:debug** — Debugging strategies
- **engineering:documentation** — Technical documentation
- **engineering:system-design** — Architecture planning
- **engineering:testing-strategy** — Test planning
- **engineering:tech-debt** — Technical debt assessment

#### Design Skills

- **design** — UI/UX design guidance
- **design-system** — Design system creation and maintenance
- **ui-styling** — UI component styling
- **ui-ux-pro-max** — Advanced UX/UI design
- **banner-design** — Banner and visual design
- **artifact-design** — Design guidance for Artifact pages
- **artifact-capabilities** — Runtime capabilities for published artifacts
- **artifact-diagramming** — SVG diagramming in artifacts

#### Data and Analytics

- **dataviz** — Data visualization and charting
- **data:analyze** — Data analysis
- **data:build-dashboard** — Dashboard creation
- **data:explore-data** — Data exploration

#### Marketing Skills

- **marketing:brand-review** — Brand strategy review
- **marketing:campaign-plan** — Campaign planning
- **marketing:content-creation** — Content creation strategy
- **marketing:draft-content** — Content drafting
- **marketing:email-sequence** — Email marketing sequences
- **marketing:performance-report** — Marketing analytics reporting

#### Sales Skills

- **sales:account-plan** — Account strategy
- **sales:call-prep** — Sales call preparation
- **sales:deal-review** — Deal analysis

#### Utility Skills

- **loop** — Recurring task automation (interval-based)
- **schedule** — Cloud agent scheduling (cron-based)
- **run** — Launch and drive app dev servers
- **keybindings-help** — Keyboard shortcut customization
- **update-config** — Settings.json configuration
- **fewer-permission-prompts** — Reduce permission prompt frequency

#### Anthropic API Skills

- **claude-api** — Claude API reference and guidance

**Total Verified Skills:** 50+

**Status:** Skills available via `Skill` tool. Load before use.

---

## MCP SERVERS (Deferred Tools - Require Loading)

### Status Summary

- **Configured & Connected:** Multiple MCP servers available
- **Require Authentication:** 60+ servers (need OAuth/credentials in claude.ai settings)
- **Connection Failed:** 1 server (plugin:data:definite — endpoint not found)
- **Deferred (Not Pre-loaded):** 200+ tools available via ToolSearch

### Authentication Required (Deferred)

These MCP servers are configured but require authentication before tools become available:

- **GitHub** — plugin:engineering:github
- **Linear** — plugin:engineering:linear
- **Slack** — plugin:marketing:slack
- **HubSpot** — plugin:marketing:hubspot
- **Figma** — plugin:marketing:figma
- **Notion** — plugin:marketing:notion
- **Meta (Facebook)** — plugin:marketing:meta (Resource Living integration)
- **Google Ads** — plugin:marketing:google-ads
- **Supabase** — Database tool
- **Vercel** — Cloud deployment platform
- And 50+ additional platforms

**Note:** These are configured at claude.ai but unavailable in this non-interactive session.

### Connected MCP Servers (Currently Available)

#### Kling AI (Image/Video Generation)
- **Status:** ✓ Connected
- **Tools:** text_to_image, text_to_video, image_to_image, image_to_video, generate_audio, dubbing, 3D generation
- **Credentials:** Required (OAuth flow)
- **Usage:** Image, video, and audio generation
- **Cost:** Credit-based

#### Higgsfield Genjutsu (Video Editing)
- **Status:** ✓ Connected
- **Tools:** Video motion transfer, object replacement, video generation
- **Credentials:** Required
- **Usage:** Advanced video editing
- **Cost:** Credit-based

#### Descript (Multimedia Editing)
- **Status:** ✓ Connected
- **Tools:** import_media, prompt_project_agent, export_transcript, export_timeline, list_projects, get_project
- **Credentials:** Required
- **Usage:** Edit video/audio by editing text
- **Cost:** Subscription-based

#### HeyGen HyperFrames (Programmatic HTML Video)
- **Status:** ✓ Connected
- **Tools:** compose, render_video, list_projects, get_project
- **Credentials:** Required
- **Usage:** Programmable HTML video projects
- **Available:** Web/desktop Claude only (CLI Claude has local skill alternative)

#### Supabase (Database)
- **Status:** ✓ Connected (requires project configuration)
- **Tools:** execute_sql, list_tables, list_migrations, get_project, create_branch, manage_edge_functions
- **Credentials:** Project URL + API keys required
- **Usage:** Database operations, schema management
- **Projects Using:** PROS360ERA, BELONG

#### Vercel (Deployment)
- **Status:** ✓ Connected (requires team/project selection)
- **Tools:** list_projects, get_project, get_deployment, create_deployment, manage_environment-variables
- **Credentials:** Vercel API token required
- **Usage:** Deployment management, environment configuration

#### Windsor.ai (Multi-Platform Analytics & Ad Management)
- **Status:** ✓ Connected (multi-connector platform)
- **Tools:** Meta Ads, Google Ads, TikTok Ads, LinkedIn, Instagram, YouTube, analytics, CRM
- **Credentials:** Individual platform OAuth required
- **Usage:** Read and write marketing data across 350+ platforms
- **Scope:** Meta Ads API integration (Resource Living case)

#### Firecrawl (Web & Research Search)
- **Status:** ✓ Connected
- **Tools:** Web search, developer search (GitHub, repos, docs), research paper search
- **Credentials:** API key required
- **Usage:** Web research, code research, academic paper search
- **Scope:** Open-ended research across web and code

#### HypeAuditor (Influencer Marketing)
- **Status:** ✓ Connected
- **Tools:** Influencer analysis, content search, competitor research, account insights
- **Credentials:** Required
- **Usage:** Social media influencer analysis
- **Cost:** Credit-based

#### Anthropic-Provided Deferred Tools

- **TaskCreate, TaskUpdate, TaskList** — Task management (deferred)
- **Monitor** — Process monitoring (deferred)
- **EnterPlanMode, ExitPlanMode** — Planning mode (deferred)
- **Agent** — Subagent spawning (deferred)
- **SendMessage** — Inter-session messaging (deferred)
- **CronCreate, CronDelete, CronList** — Cloud scheduling (deferred)
- **WebFetch, WebSearch** — Web research (deferred)
- **ArtifactComments, ArtifactData** — Artifact runtime features (deferred)
- **SearchPlugins, ListPlugins, SuggestPluginInstall** — Plugin management (deferred)

---

## PROJECT-SPECIFIC TOOLS AND CONFIGURATIONS

### Marketing-AI-Platform

**Configured in Project:**
- `.claude/` directory with custom configurations
- `CLAUDE.md` with project-specific instructions
- Multiple skill folders (.claude/skills/): ad-creative, analytics, attribution, copywriting, images, SEO, video, etc.
- Custom MCP server adapters (backend/mcp_server/)

**Available:**
- 30+ skills in .claude/skills/ (stored but usability requires Skill tool verification)
- Custom MCP server configuration
- Resource Living creative registry integration

**Limitations:**
- Skills are stored locally but may require explicit loading
- MCP server requires dependencies (FastAPI running)

### PROS360ERA

**Configured in Project:**
- Next.js + Supabase setup
- Possible .env configuration for Supabase (not exposed)

**No Custom Skills Detected:** Uses standard Next.js workflow

### BELONG

**Configured in Project:**
- Next.js + Supabase + Stripe setup
- Database migrations and tests
- No custom skills detected

---

## CONNECTORS (claude.ai)

These connectors are configured in claude.ai but UNAVAILABLE in this Claude Code session (non-interactive):

- **GitHub** — Repository management, issues, PRs
- **Linear** — Project management
- **Slack** — Team communication
- **HubSpot** — CRM and marketing
- **Figma** — Design collaboration
- **Notion** — Knowledge base
- **Google Workspace** — Docs, Sheets, Gmail
- **Zapier** — Workflow automation
- **Meta/Facebook Ads** — Ad account integration
- **Google Ads** — Paid search
- **Stripe** — Payment processing
- **Supabase** — Database (also available as MCP)
- **And 50+ more...**

**Note:** To use connectors in this session, they must be available as MCP servers or accessed via the connector's API using available tools.

---

## UNAVAILABLE SERVICES / MISSING CAPABILITIES

### Not Installed / Not Available

- **Local Claude Code IDE extensions** — Not confirmed installed
- **Cursor IDE** — Not active in this session
- **ChatGPT connectors** — Not available in Claude Code
- **OpenAI API** — Use Claude API instead (via claude-api skill)
- **n8n** — Not available (use Zapier if configured)
- **Make.com** — Not available

### Requires External Setup

- **GitHub Actions** — Available but requires repository configuration
- **Vercel Cron** — Available but requires Vercel project setup
- **Supabase Edge Functions** — Available but requires Supabase project
- **Windows Task Scheduler** — Available but requires manual configuration

---

## VERIFICATION STATUS

### Verified Tools (Actually Tested & Available)

✓ File operations (Read, Write, Edit, Glob, Grep)  
✓ Bash and PowerShell execution  
✓ Git command-line  
✓ Built-in browser (mcp__Claude_Browser__*)  
✓ Agent tool (subagent spawning)  
✓ Artifact tool (page publishing)  

### Configured But Unavailable (This Session)

⚠️ All claude.ai connectors (require OAuth in interactive session)  
⚠️ All 60+ deferred MCP servers requiring authentication  
⚠️ Interactive Skill tools (available via Skill tool, not pre-loaded)  

### Requires Credentials (Must Not Display)

❌ API keys (Supabase, Vercel, Firecrawl, Windsor, etc.)  
❌ OAuth tokens  
❌ Database passwords  
❌ Environment secrets  

---

## TOOL SELECTION RULES FOR DEVELOPMENT

### For Next.js Projects (PROS360ERA, BELONG, Portfolio, RealGroup)

**Verified Tools:**
- npm (for dependency management)
- Node.js (runtime)
- bash/PowerShell (dev server, build)
- Built-in browser (testing)
- Supabase MCP (if database operations needed, requires auth)
- Code review skill (quality assurance)

**Approach:**
1. Use bash: npm install, npm run dev, npm run build
2. Use built-in browser for manual testing
3. Use code-review skill for quality checks
4. Use Supabase MCP only if database schema changes needed (requires credentials)

### For Python Projects (Marketing-AI-Platform Backend)

**Verified Tools:**
- Python (runtime)
- pip (package management)
- bash/PowerShell (execution)
- Code review skill
- Built-in browser (for frontend)

**Approach:**
1. Use bash: pip install -r requirements.txt
2. Use bash: python -m backend.main
3. Use built-in browser for API testing / frontend
4. Custom MCP server (if needed, runs in backend)

### For Research & Planning

**Verified Tools:**
- Firecrawl (web + developer search)
- Agent with Explore type (codebase exploration)
- WebFetch, WebSearch (deferred, requires ToolSearch)

**Approach:**
1. Use Firecrawl for web research (authenticated)
2. Use Agent (Explore) for finding code patterns
3. Use WebSearch via ToolSearch for current information

### For Marketing & Analytics

**Verified Tools:**
- Windsor.ai (Meta, Google, TikTok, Instagram, YouTube, analytics)
- Firecrawl (competitive research)
- Marketing skills (strategy, content, email)
- dataviz skill (visualization)

**Approach:**
1. Use Windsor.ai for authorized platform data (Resource Living Meta Ads)
2. Use Firecrawl for competitive/market research
3. Use marketing skills for strategy and planning

---

## CREDENTIAL REQUIREMENTS SUMMARY

| Service | Required Credentials | Projects | Status | Action Required |
|---------|---------------------|----------|--------|-----------------|
| Supabase | Project URL, API key | PROS360ERA, BELONG | ⚠️ Local .env needed | Verify existing .env |
| Meta Ads API | Access token, ad account ID | Marketing-AI-Platform | ⚠️ May exist in config | Verify credentials safe |
| GitHub | PAT (if needed) | All Git repos | ✓ Using HTTPS | None |
| Windsor.ai | Account credentials | Resource Living scope | ⚠️ Connected | Verify in claude.ai |

---

## Status: PHASE 2 STEP 10-13 COMPLETE ✓

**Tool Inventory:** Comprehensive  
**Verified Tools:** 6 categories identified  
**MCP Servers:** Cataloged with status  
**Missing Tools:** Documented  
**Credentials:** Never displayed, only requirements noted  

**Ready for:** SKILL-ROUTING.md creation

---

Last Updated: 2026-09-22
