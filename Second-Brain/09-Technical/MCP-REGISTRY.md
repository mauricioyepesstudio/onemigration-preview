---
title: MCP Server Registry
type: Technical Reference
created: 2026-09-22
---

# 🔌 MCP Server Registry

Inventory of MCP (Model Context Protocol) servers available in Claude Code environment.

## Status Summary

- **Connected & Available:** 8 major MCP servers
- **Require Authentication:** 60+ additional connectors (available in claude.ai)
- **Connection Failed:** 1 (plugin:data:definite)
- **Deferred (Require ToolSearch):** 200+ tools

## Actively Connected MCP Servers

### Kling AI
**Status:** ✓ Connected  
**Tools:** Image/Video/Audio generation  
**Auth:** Required (OAuth flow)  
**Projects:** Marketing-AI-Platform (creative generation)  
**MCP Version:** Check with who_am_i tool  
**Credentials:** Never display tokens

### Higgsfield Genjutsu
**Status:** ✓ Connected  
**Tools:** Video motion transfer, object replacement  
**Auth:** Required  
**Use Case:** Advanced video editing for ads

### Descript
**Status:** ✓ Connected  
**Tools:** Media import, project management, export  
**Auth:** Required  
**Use Case:** Multimedia editing by editing text

### HeyGen HyperFrames
**Status:** ✓ Connected  
**Tools:** Programmatic HTML video  
**Auth:** Required  
**Availability:** Web/desktop Claude (local skill alternative for CLI)  
**Use Case:** Interactive video projects

### Supabase
**Status:** ✓ Connected  
**Auth:** Project-specific (URL + API keys)  
**Projects:** PROS360ERA, BELONG  
**Tools:** execute_sql, schema management, migrations, edge functions  
**Safety:** Read-only by default, approval for schema changes

### Vercel
**Status:** ✓ Connected  
**Auth:** API token required  
**Tools:** Deployment management, environment variables  
**Projects:** All Next.js apps (PROS360ERA, Portfolio, RealGroup, BELONG)  
**Safety:** Test deployments first, approval for production

### Windsor.ai
**Status:** ✓ Connected  
**Auth:** Platform-specific OAuth  
**Platforms:** Meta Ads, Google Ads, TikTok, LinkedIn, Instagram, YouTube, analytics, CRM  
**Projects:** Marketing-AI-Platform (Resource Living case)  
**Scope:** Read/write to 350+ marketing platforms  
**Safety:** Test data first, approval for campaign changes

### Firecrawl
**Status:** ✓ Connected  
**Tools:** Web search, developer search (GitHub/docs), research paper search  
**Auth:** API key  
**Use Case:** Research, competitive analysis, technical documentation lookup

## Unavailable in This Session

**Claude.ai Connectors:** 50+ platforms (GitHub, Slack, HubSpot, Figma, etc.)  
**Status:** Configured but require interactive OAuth flow  
**Workaround:** Use equivalent MCP servers (Supabase, Vercel, Windsor.ai) or CLI tools

## MCP Authentication Policy

- **Never display:** API keys, OAuth tokens, credentials
- **Safe to display:** Service names, available scopes, field names
- **When credentials needed:** Request owner approval first
- **Session-specific:** Credentials don't persist across sessions

## Adding New MCP Servers

Process (when needed):
1. Verify in ~/.claude/config
2. Load schema with ToolSearch
3. Test with read-only operation first
4. Document in this registry
5. Add to TOOL-REGISTRY.md

---

**Status:** MCP-REGISTRY Complete ✓

Last Updated: 2026-09-22
