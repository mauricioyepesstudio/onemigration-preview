# Home Computer Bootstrap Script
# Safely sets up the home workspace without overwriting work or exposing secrets
# PowerShell 5.1 compatible

param(
    [string]$WorkspacePath = "",
    [switch]$SkipConfirmation = $false
)

Write-Host "🏠 Home Computer Bootstrap Setup" -ForegroundColor Cyan
Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Gray
Write-Host ""

# Step 1: Verify prerequisites
Write-Host "🔍 Step 1: Verifying prerequisites..." -ForegroundColor Yellow

$gitVersion = git --version 2>$null
if (-not $?) {
    Write-Error "Git not found. Please install Git for Windows."
    exit 1
}
Write-Host "✓ Git: $gitVersion" -ForegroundColor Green

$pythonVersion = python --version 2>$null
if (-not $?) {
    Write-Warning "Python not found. Some projects may require Python."
} else {
    Write-Host "✓ Python: $pythonVersion" -ForegroundColor Green
}

$nodeVersion = node --version 2>$null
if (-not $?) {
    Write-Error "Node.js not found. Required for Next.js projects."
    exit 1
}
Write-Host "✓ Node.js: $nodeVersion" -ForegroundColor Green

Write-Host ""

# Step 2: Determine workspace path
Write-Host "📂 Step 2: Workspace location..." -ForegroundColor Yellow

if ($WorkspacePath -eq "") {
    $defaultPath = "C:\Users\$env:USERNAME\AI-Projects"
    $WorkspacePath = Read-Host "Enter workspace root path (default: $defaultPath)"
    if ($WorkspacePath -eq "") {
        $WorkspacePath = $defaultPath
    }
}

Write-Host "Workspace: $WorkspacePath" -ForegroundColor Cyan

if (-not (Test-Path $WorkspacePath)) {
    Write-Host "Creating workspace directory..." -ForegroundColor Gray
    New-Item -ItemType Directory -Path $WorkspacePath -Force | Out-Null
    Write-Host "✓ Created" -ForegroundColor Green
}

Write-Host ""

# Step 3: Create required directories
Write-Host "📁 Step 3: Creating directory structure..." -ForegroundColor Yellow

$requiredDirs = @(
    "Second-Brain",
    "control-plane",
    "control-plane\config",
    "control-plane\scripts",
    "control-plane\workflows",
    "control-plane\reports",
    "control-plane\logs",
    "control-plane\state",
    "control-plane\monitors",
    "control-plane\approvals"
)

foreach ($dir in $requiredDirs) {
    $fullPath = Join-Path $WorkspacePath $dir
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "✓ $dir" -ForegroundColor Green
    } else {
        Write-Host "→ $dir (exists)" -ForegroundColor Gray
    }
}

Write-Host ""

# Step 4: Clone approved repositories
Write-Host "🔗 Step 4: Cloning repositories..." -ForegroundColor Yellow

$repos = @(
    @{
        Name = "control-plane"
        URL = "https://github.com/mauricioyepesstudio/ai-projects-control-plane.git"
        Path = "control-plane"
        Required = $true
    },
    @{
        Name = "PROS360ERA"
        URL = "https://github.com/mauricioyepesstudio/pros360era.git"
        Path = "pros360era"
        Required = $false
    },
    @{
        Name = "Marketing-AI-Platform"
        URL = "https://github.com/mauricioyepesstudio/marketing-ai-platform.git"
        Path = "marketing-ai-platform"
        Required = $false
    }
)

foreach ($repo in $repos) {
    $repoPath = Join-Path $WorkspacePath $repo.Path

    if (Test-Path $repoPath) {
        Write-Host "→ $($repo.Name) (already cloned)" -ForegroundColor Gray
        continue
    }

    Write-Host "Cloning $($repo.Name)..." -ForegroundColor Gray
    git clone $repo.URL $repoPath 2>&1 | Out-Null
    if ($?) {
        Write-Host "✓ $($repo.Name)" -ForegroundColor Green
    } else {
        if ($repo.Required) {
            Write-Error "Failed to clone $($repo.Name) (required)"
            exit 1
        } else {
            Write-Warning "Could not clone $($repo.Name) (optional)"
        }
    }
}

Write-Host ""

# Step 5: Create workspace.local.json
Write-Host "⚙️  Step 5: Creating workspace configuration..." -ForegroundColor Yellow

$configPath = Join-Path $WorkspacePath "control-plane\config\workspace.local.json"

if (-not (Test-Path $configPath)) {
    $localConfig = @{
        machine = @{
            name = $env:COMPUTERNAME
            role = "development"
            os = "windows"
            powershell_version = $PSVersionTable.PSVersion.ToString()
        }
        paths = @{
            ai_projects_root = $WorkspacePath
            second_brain = Join-Path $WorkspacePath "Second-Brain"
            control_plane = Join-Path $WorkspacePath "control-plane"
            projects_base = $WorkspacePath
        }
        credentials = @{
            note = "Do not add actual secrets. Use environment variables or secure store."
            supabase_url_env = "SUPABASE_URL"
            vercel_token_env = "VERCEL_TOKEN"
        }
        automation = @{
            scheduler_enabled = $false
            last_cycle = Get-Date -Format "o"
        }
    } | ConvertTo-Json

    $localConfig | Set-Content $configPath -Encoding UTF8
    Write-Host "✓ Configuration created" -ForegroundColor Green
} else {
    Write-Host "→ Configuration exists" -ForegroundColor Gray
}

Write-Host ""

# Step 6: Verify repositories
Write-Host "🔎 Step 6: Verifying repository setup..." -ForegroundColor Yellow

$repoCheckFailed = $false
foreach ($repo in $repos) {
    $repoPath = Join-Path $WorkspacePath $repo.Path

    if (-not (Test-Path $repoPath)) {
        if ($repo.Required) {
            Write-Error "$($repo.Name) not found"
            $repoCheckFailed = $true
        }
        continue
    }

    Push-Location $repoPath
    $branch = git rev-parse --abbrev-ref HEAD 2>$null
    if ($?) {
        Write-Host "✓ $($repo.Name) on branch: $branch" -ForegroundColor Green
    } else {
        Write-Host "⚠️  $($repo.Name) - Git verification failed" -ForegroundColor Yellow
    }
    Pop-Location
}

if ($repoCheckFailed) {
    exit 1
}

Write-Host ""

# Step 7: Check dependencies
Write-Host "📦 Step 7: Checking dependencies..." -ForegroundColor Yellow

$needsDependencies = $false

foreach ($repo in $repos) {
    $repoPath = Join-Path $WorkspacePath $repo.Path

    if (-not (Test-Path $repoPath)) {
        continue
    }

    if (Test-Path "$repoPath\package.json") {
        if (-not (Test-Path "$repoPath\node_modules")) {
            Write-Warning "$($repo.Name) needs npm install"
            $needsDependencies = $true
        } else {
            Write-Host "✓ $($repo.Name) - node_modules present" -ForegroundColor Green
        }
    }

    if (Test-Path "$repoPath\requirements.txt") {
        Write-Warning "$($repo.Name) requires pip install (venv setup needed)"
        $needsDependencies = $true
    }
}

if ($needsDependencies) {
    Write-Host ""
    Write-Host "Dependencies need installation in next step." -ForegroundColor Yellow
}

Write-Host ""

# Step 8: Optional dependency installation
if ($needsDependencies) {
    Write-Host "📥 Step 8: Installing dependencies..." -ForegroundColor Yellow

    if (-not $SkipConfirmation) {
        $confirm = Read-Host "Install dependencies now? (y/n)"
        if ($confirm -ne "y") {
            Write-Host "⏭️  Skipping dependency installation" -ForegroundColor Gray
        }
    }

    if ($SkipConfirmation -or $confirm -eq "y") {
        foreach ($repo in $repos) {
            $repoPath = Join-Path $WorkspacePath $repo.Path

            if (-not (Test-Path $repoPath)) {
                continue
            }

            if (Test-Path "$repoPath\package.json") {
                Push-Location $repoPath
                Write-Host "npm install in $($repo.Name)..." -ForegroundColor Gray
                npm install 2>&1 | Out-Null
                if ($?) {
                    Write-Host "✓ $($repo.Name)" -ForegroundColor Green
                } else {
                    Write-Warning "npm install failed in $($repo.Name)"
                }
                Pop-Location
            }
        }
    }
}

Write-Host ""

# Step 9: Health check
Write-Host "🏥 Step 9: Running health check..." -ForegroundColor Yellow

$controlPlanePath = Join-Path $WorkspacePath "control-plane"
$healthScriptPath = Join-Path $controlPlanePath "scripts\check-sync-health.ps1"

if (Test-Path $healthScriptPath) {
    & $healthScriptPath -ConfigPath $configPath 2>&1 | Out-Null
    Write-Host "✓ Health check completed" -ForegroundColor Green
} else {
    Write-Warning "Health check script not found"
}

Write-Host ""

# Step 10: Report
Write-Host "📋 Bootstrap Setup Report" -ForegroundColor Cyan
Write-Host ""
Write-Host "Workspace Path: $WorkspacePath" -ForegroundColor White
Write-Host "Configuration: $configPath" -ForegroundColor White
Write-Host "Machine Name: $env:COMPUTERNAME" -ForegroundColor White
Write-Host "PowerShell: $($PSVersionTable.PSVersion)" -ForegroundColor White
Write-Host ""
Write-Host "✓ Setup complete" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Gray
Write-Host "1. Review workspace.local.json"
Write-Host "2. Copy any required .env files"
Write-Host "3. Run: control-plane/scripts/check-sync-health.ps1"
Write-Host "4. Start dev servers: npm run dev (in project dir)"
Write-Host ""
