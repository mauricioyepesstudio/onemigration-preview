# Daily Operating Cycle - Dry-Run Entry Point
# PowerShell 5.1 compatible

param(
    [string]$ConfigPath = "$PSScriptRoot\..\config\workspace.local.json",
    [switch]$DryRun = $true
)

$startTime = Get-Date
$RunId = "$($startTime.ToString('yyyyMMdd-HHmmss'))-$(Get-Random -Minimum 1000 -Maximum 9999)"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Daily Operating Cycle - Dry-Run Mode" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Run ID: $RunId" -ForegroundColor Yellow
Write-Host "Start: $($startTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Gray
Write-Host ""

# Load configuration
Write-Host "STAGE 1: CONTEXT RECOVERY" -ForegroundColor White

if (-not (Test-Path $ConfigPath)) {
    Write-Error "Configuration not found: $ConfigPath"
    exit 1
}

$config = Get-Content $ConfigPath | ConvertFrom-Json
$workspaceRoot = $config.paths.ai_projects_root

Write-Host "  Config loaded: $ConfigPath" -ForegroundColor Green
Write-Host "  Workspace: $workspaceRoot" -ForegroundColor Green
Write-Host ""

# Repository health
Write-Host "STAGE 2: REPOSITORY HEALTH CHECK" -ForegroundColor White

$projects = @(
    @{ Name = "PROS360ERA"; Path = "$env:USERPROFILE\pros360era" },
    @{ Name = "Marketing-AI"; Path = "$env:USERPROFILE\Desktop\marketing-ai-platform" },
    @{ Name = "BELONG"; Path = "$workspaceRoot\belong-v25-candidate" },
    @{ Name = "Portfolio"; Path = "$env:USERPROFILE\Desktop\mauricio-portfolio" },
    @{ Name = "RealGroup"; Path = "$env:USERPROFILE\Desktop\realgroup-website" },
    @{ Name = "Agency-Agents"; Path = "$workspaceRoot\agency-agents" }
)

$healthy = 0
$issues = 0

foreach ($proj in $projects) {
    if (Test-Path $proj.Path) {
        Push-Location $proj.Path
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        $commit = git rev-parse --short HEAD 2>$null
        $changes = (git status --porcelain 2>$null | Measure-Object -Line).Lines

        if ($branch -and $changes -eq 0) {
            Write-Host "  OK: $($proj.Name) on $branch (clean)" -ForegroundColor Green
            $healthy++
        } elseif ($branch) {
            Write-Host "  WARN: $($proj.Name) has $changes changes" -ForegroundColor Yellow
            $issues++
        } else {
            Write-Host "  ERROR: $($proj.Name) not a Git repository" -ForegroundColor Red
            $issues++
        }
        Pop-Location
    } else {
        Write-Host "  ERROR: $($proj.Name) path not found" -ForegroundColor Red
        $issues++
    }
}

Write-Host ""
Write-Host "STAGE 3-5: PRODUCTION, BUSINESS, PRIORITIZATION" -ForegroundColor White
Write-Host "  Skipped in dry-run mode (no external access)" -ForegroundColor Cyan
Write-Host ""

Write-Host "STAGE 6-8: EXECUTION, VERIFICATION, DOCUMENTATION" -ForegroundColor White
Write-Host "  No changes executed in dry-run mode" -ForegroundColor Cyan
Write-Host ""

Write-Host "STAGE 9: DAILY REPORT GENERATION" -ForegroundColor White
$endTime = Get-Date
$duration = $endTime - $startTime

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Cycle Complete" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Run ID:            $RunId" -ForegroundColor Yellow
Write-Host "Mode:              Dry-Run (read-only)" -ForegroundColor Green
Write-Host "Start:             $($startTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Gray
Write-Host "End:               $($endTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Gray
Write-Host "Duration:          $([math]::Round($duration.TotalSeconds, 2)) seconds" -ForegroundColor Gray
Write-Host ""
Write-Host "Projects Checked:  $($projects.Count)" -ForegroundColor White
Write-Host "Healthy:           $healthy" -ForegroundColor Green
Write-Host "Issues Found:      $issues" -ForegroundColor $(if ($issues -gt 0) { 'Yellow' } else { 'Green' })
Write-Host ""
Write-Host "Exit Code:         0 (success)" -ForegroundColor Green
Write-Host ""

# Save run state
$stateDir = "$workspaceRoot\control-plane\state"
if (-not (Test-Path $stateDir)) {
    New-Item -ItemType Directory -Path $stateDir -Force | Out-Null
}

$result = @{
    runId = $RunId
    mode = "dry-run"
    startTime = $startTime.ToString("o")
    endTime = $endTime.ToString("o")
    durationSeconds = [math]::Round($duration.TotalSeconds, 2)
    projectsChecked = $projects.Count
    healthyProjects = $healthy
    projectsWithIssues = $issues
    exitCode = 0
}

$result | ConvertTo-Json | Set-Content "$stateDir\last-cycle-$RunId.json"
Write-Host "State saved to: $stateDir\last-cycle-$RunId.json" -ForegroundColor Gray

exit 0
