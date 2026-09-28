---
title: Office Machine Configuration
type: Machine Setup
date: 2026-09-22
machine: office
status: Active
---

# 🖥️ Office Machine Configuration

**Machine Role:** Primary automation leader (candidate)

---

## Hardware & OS

- **Operating System:** Windows 11 Pro 10.0.26200
- **PowerShell Version:** 5.1 (Windows PowerShell)
- **Shell Environment:** bash (Git Bash available)

---

## Installed Runtimes

| Tool | Version | Installation Method | Verification |
|------|---------|---------------------|--------------|
| Python | 3.14.7 | System | `python --version` |
| Node.js | v24.18.0 | System | `node --version` |
| npm | 11.16.0 | System | `npm --version` |
| Git | 2.55.0.windows.2 | System | `git --version` |
| PowerShell | 5.1 | System | `$PSVersionTable.PSVersion` |

---

## Workspace Location

**Primary:** C:\Users\graphics1\AI-Projects

**Repository Base Locations:**
- PROS360ERA: C:\Users\graphics1\pros360era
- Marketing-AI: C:\Users\graphics1\Desktop\marketing-ai-platform
- BELONG: C:\Users\graphics1\AI-Projects\belong-v25-candidate
- Portfolio: C:\Users\graphics1\Desktop\mauricio-portfolio
- RealGroup: C:\Users\graphics1\Desktop\realgroup-website
- Agency-Agents: C:\Users\graphics1\agency-agents

---

## Verified Skills & MCP Servers

**Verified Available:**
- ✓ Bash execution
- ✓ PowerShell execution
- ✓ Claude File tools (Read, Write, Edit, Glob, Grep)
- ✓ Built-in Browser
- ✓ Agent tool (subagent spawning)
- ✓ Artifact tool (page publishing)

**Connected MCP Servers:**
- ✓ Kling AI (image/video generation)
- ✓ Descript (multimedia editing)
- ✓ Supabase (requires project auth)
- ✓ Vercel (requires team/project)
- ✓ Windsor.ai (multi-platform analytics)
- ✓ Firecrawl (web search)
- ✓ HeyGen HyperFrames (programmatic video)

**Configured but Unavailable This Session:**
- ⚠️ All claude.ai connectors (require interactive OAuth)
- ⚠️ 60+ platform connectors (require authentication)

---

## Required Credentials (Do Not Store Locally)

Projects requiring credentials:
- **PROS360ERA:** Supabase (SUPABASE_URL, SUPABASE_KEY)
- **BELONG:** Supabase (if database operations needed)
- **Marketing-AI:** Meta Graph API (if social sync needed)

**Storage Method:** Environment variables or secure system credential store  
**CI/CD:** GitHub encrypted secrets / Vercel environment variables

---

## Automation Status

**Current:** All schedulers disabled  
**Candidate Role:** Primary automation leader (awaiting approval)  
**Configuration File:** control-plane/config/workspace.local.json (machine-specific)

**Scheduler Options Available:**
- Windows Task Scheduler
- Claude Code scheduled tasks (via Skill)
- PowerShell scheduled tasks

---

## Network & Remote Access

**Git Remotes Verified:**
- ✓ All GitHub remotes reachable (HTTPS)
- ✓ No authentication issues detected

**External Services:**
- ✓ GitHub accessible
- ✓ Vercel API accessible (with token)
- ✓ Supabase accessible (with credentials)

---

## Development Environment State

**Node.js Projects:** All dependencies in place (verified)
- PROS360ERA: npm 11.16.0, node_modules present
- Portfolio: Ready
- RealGroup: Ready
- BELONG: Ready (if needed)

**Python Projects:** venv required before use
- Marketing-AI: Requires `pip install -r requirements.txt`

**Database:** Local SQLite (Marketing-AI) — no credentials needed

---

## Known Configuration

- ✓ Git identity configured (use `git config --global user.name/email` to verify)
- ✓ SSH key access not required (using HTTPS)
- ⚠️ .env files present in some projects (preserve, do not commit)

---

## Next Session: Verify This Checklist

- [ ] Python 3.14.7 available: `python --version`
- [ ] Node.js v24.18.0 available: `node --version`
- [ ] Git 2.55.0+ available: `git --version`
- [ ] All workspace paths exist and accessible
- [ ] workspace.local.json in control-plane/config/
- [ ] Git remotes reachable
- [ ] No uncommitted changes lost from any project

---

**Status:** Machine ready for autonomous operations (awaiting scheduler approval)

Last Updated: 2026-09-22
