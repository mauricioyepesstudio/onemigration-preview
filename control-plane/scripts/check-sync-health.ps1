# Synchronization Health Check (Read-Only)
# Inspects all repositories and reports status without making changes
# PowerShell 5.1 compatible - no && operator

param(
    [string]$ConfigPath = "$PSScriptRoot\..\config\workspace.local.json"
)

Write-Host "🔍 Synchronization Health Check - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
Write-Host ""

# Load configuration
if (-not (Test-Path $ConfigPath)) {
    Write-Error "Configuration file not found: $ConfigPath"
    exit 1
}

$config = Get-Content $ConfigPath | ConvertFrom-Json
$rootPath = $config.paths.ai_projects_root

Write-Host "Workspace: $rootPath" -ForegroundColor Gray
Write-Host ""

# Define repositories to check
$repositories = @(
    @{
        Name = "PROS360ERA"
        Path = "$env:USERPROFILE\pros360era"
        Type = "Canonical"
    },
    @{
        Name = "Marketing-AI-Platform"
        Path = "$env:USERPROFILE\Desktop\marketing-ai-platform"
        Type = "Canonical"
    },
    @{
        Name = "BELONG"
        Path = "$rootPath\belong-v25-candidate"
        Type = "Candidate"
    },
    @{
        Name = "Mauricio-Portfolio"
        Path = "$env:USERPROFILE\Desktop\mauricio-portfolio"
        Type = "Canonical"
    },
    @{
        Name = "RealGroup-Website"
        Path = "$env:USERPROFILE\Desktop\realgroup-website"
        Type = "Canonical"
    },
    @{
        Name = "Agency-Agents"
        Path = "$rootPath\agency-agents"
        Type = "External"
    }
)

# Check each repository
foreach ($repo in $repositories) {
    Write-Host "📦 $($repo.Name) [$($repo.Type)]" -ForegroundColor White

    # Check if path exists
    if (-not (Test-Path $repo.Path)) {
        Write-Host "  ❌ Path not found: $($repo.Path)" -ForegroundColor Red
        Write-Host ""
        continue
    }

    Write-Host "  📍 $($repo.Path)" -ForegroundColor Gray

    # Check Git status (read-only operations only)
    Push-Location $repo.Path

    try {
        # Get current branch
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if ($?) {
            Write-Host "  🌿 Branch: $branch" -ForegroundColor Yellow
        }

        # Get current commit
        $commit = git rev-parse --short HEAD 2>$null
        if ($?) {
            Write-Host "  📍 Commit: $commit" -ForegroundColor Yellow
        }

        # Check remote configuration
        $remote = git config --get remote.origin.url 2>$null
        if ($?) {
            Write-Host "  🔗 Remote: $remote" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  No remote configured" -ForegroundColor Yellow
        }

        # Check status (uncommitted changes)
        $status = git status --porcelain 2>$null
        if ($status) {
            $changeCount = ($status | Measure-Object -Line).Lines
            Write-Host "  ⚠️  Uncommitted changes: $changeCount files" -ForegroundColor Yellow
        } else {
            Write-Host "  ✓ Working tree clean" -ForegroundColor Green
        }

        # Check ahead/behind (read-only)
        git fetch --dry-run 2>$null
        $localCommits = (git rev-list --count HEAD ^origin/HEAD 2>$null) -as [int]
        $remoteCommits = (git rev-list --count origin/HEAD ^HEAD 2>$null) -as [int]

        if ($localCommits -gt 0) {
            Write-Host "  ↑ Ahead by $localCommits commits" -ForegroundColor Cyan
        }
        if ($remoteCommits -gt 0) {
            Write-Host "  ↓ Behind by $remoteCommits commits" -ForegroundColor Cyan
        }
        if ($localCommits -eq 0 -and $remoteCommits -eq 0) {
            Write-Host "  ✓ Synchronized with remote" -ForegroundColor Green
        }

        # Check stashes
        $stashes = git stash list 2>$null
        if ($stashes) {
            $stashCount = ($stashes | Measure-Object -Line).Lines
            Write-Host "  📦 Stashes: $stashCount" -ForegroundColor Cyan
        }

        # Check lockfile presence
        if (Test-Path "package-lock.json") {
            Write-Host "  ✓ package-lock.json present" -ForegroundColor Green
        }
        if (Test-Path "requirements.txt") {
            Write-Host "  ✓ requirements.txt present" -ForegroundColor Green
        }

        # Summary: Can safe pull happen?
        if ($status -and $remoteCommits -gt 0) {
            Write-Host "  ⚠️  Manual review required: uncommitted changes + remote updates" -ForegroundColor Yellow
        }
        if (-not $status -and $remoteCommits -gt 0) {
            Write-Host "  ✓ Safe to pull (clean tree, behind remote)" -ForegroundColor Green
        }

    } catch {
        Write-Host "  ❌ Error checking repository: $_" -ForegroundColor Red
    } finally {
        Pop-Location
    }

    Write-Host ""
}

Write-Host "✓ Health check complete - $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Green
Write-Host ""
Write-Host "Legend:" -ForegroundColor Gray
Write-Host "  ✓ = Healthy"
Write-Host "  ⚠️  = Requires attention"
Write-Host "  ❌ = Error"
Write-Host ""
Write-Host "This is a read-only check. No changes were made." -ForegroundColor Gray
