---
title: Home Computer Setup Guide
type: Setup Instructions
date: 2026-09-22
---

# 🏠 Home Computer Setup Guide

Step-by-step instructions for setting up the home workspace.

---

## Prerequisites

- Windows 10+ or macOS/Linux
- Git installed (`git --version` works)
- Node.js 20+ installed (`node --version` works)
- Python 3.8+ installed (`python --version` works) — *optional for some projects*

---

## Quick Setup (Automated)

Run the bootstrap script from the office control-plane repository:

```powershell
# From PowerShell
$bootstrapScript = "C:\path\to\control-plane\scripts\bootstrap-home.ps1"
& $bootstrapScript
```

Follow the interactive prompts to:
1. Confirm Git, Node.js, Python installations
2. Enter workspace path (default: `C:\Users\YourName\AI-Projects`)
3. Clone approved repositories
4. Create machine-specific configuration
5. Optionally install dependencies

---

## Manual Setup (If Bootstrap Fails)

### Step 1: Create Workspace Directory

```powershell
$workspacePath = "C:\Users\$env:USERNAME\AI-Projects"
New-Item -ItemType Directory -Path $workspacePath -Force
cd $workspacePath
```

### Step 2: Clone Control-Plane Repository

```bash
git clone https://github.com/mauricioyepesstudio/ai-projects-control-plane.git control-plane
cd control-plane
```

### Step 3: Copy Office workspace.local.json Template

1. Get `workspace.local.json` from office machine (from office Computer)
2. Place it in `control-plane/config/workspace.local.json`
3. Edit machine-specific paths if necessary

### Step 4: Clone Project Repositories (Optional)

```bash
# Clone projects you need
git clone https://github.com/mauricioyepesstudio/pros360era.git
git clone https://github.com/mauricioyepesstudio/marketing-ai-platform.git

# Or set up junctions to existing repositories on network
```

### Step 5: Create Directories

```powershell
$dirs = @(
    "Second-Brain",
    "control-plane\logs",
    "control-plane\reports",
    "control-plane\state",
    "control-plane\approvals"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Path $dir -Force
}
```

### Step 6: Install Dependencies (Per Project)

For Next.js projects:
```bash
cd project-name
npm install
```

For FastAPI projects:
```bash
cd project-name
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

---

## Verification Checklist

After setup, verify everything works:

- [ ] Git version: `git --version`
- [ ] Node version: `node --version`
- [ ] Python version: `python --version` (if needed)
- [ ] Workspace path exists and accessible
- [ ] workspace.local.json created
- [ ] All required repositories cloned or linked
- [ ] npm dependencies installed (Next.js projects)
- [ ] Python venv created (FastAPI projects)

---

## Test the Setup

Run the health check script:

```powershell
.\control-plane\scripts\check-sync-health.ps1
```

Expected output: ✓ Health status for each repository

---

## Next Steps

1. **Read core documentation:**
   - Second-Brain/HOME.md
   - Second-Brain/MASTER-ROADMAP.md
   - Second-Brain/SESSION-HANDOFF.md

2. **Configure machine for automation (optional):**
   - Edit control-plane/config/workspace.local.json
   - Set automation_leader = false (home is secondary)
   - Confirm scheduler_enabled = false

3. **Start development:**
   ```bash
   cd project-name
   npm run dev        # For Next.js
   python -m backend.main  # For FastAPI
   ```

---

## Troubleshooting

**Git clone fails:**
- Verify GitHub access: `git clone https://github.com/mauricioyepesstudio/pros360era.git test-repo`
- Check network connectivity
- Verify SSH key setup (if using SSH)

**npm install fails:**
- Clear cache: `npm cache clean --force`
- Delete node_modules: `rm -r node_modules`
- Reinstall: `npm install`

**Python venv issues:**
- Delete venv folder
- Create fresh: `python -m venv venv`
- Activate: `venv\Scripts\activate`

**Workspace path issues:**
- Ensure path exists: `Test-Path 'C:\path\to\workspace'`
- Check permissions: Verify write access to directory
- Use absolute paths in workspace.local.json

---

## Home vs Office Differences

**Office Computer:**
- automation_leader = true (candidate primary)
- Scheduler enabled (when approved)
- Full development capabilities

**Home Computer:**
- automation_leader = false (secondary)
- Scheduler disabled
- Passive monitoring capability
- Can run dev servers
- Cannot run autonomous daily cycle

---

**Status:** Ready for home setup

Last Updated: 2026-09-22
