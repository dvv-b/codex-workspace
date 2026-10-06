$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot

$SourceAgents = Join-Path $RepoRoot "agents"
$SourceSkills = Join-Path $RepoRoot "skills"

$CodexAgents = Join-Path $HOME ".codex\agents"
$GlobalSkills = Join-Path $HOME ".agents\skills"

Write-Host ""
Write-Host "Codex Workspace Setup"
Write-Host "====================="
Write-Host ""

# Create destination directories
New-Item -ItemType Directory -Force -Path $CodexAgents | Out-Null
New-Item -ItemType Directory -Force -Path $GlobalSkills | Out-Null

# Install agents
Write-Host "Installing agents..."

Get-ChildItem -Path $SourceAgents -Filter "*.toml" | ForEach-Object {
    Copy-Item $_.FullName -Destination $CodexAgents -Force
    Write-Host "  OK  $($_.Name)"
}

# Install skills
Write-Host ""
Write-Host "Installing skills..."

Get-ChildItem -Path $SourceSkills -Directory | ForEach-Object {

    $Destination = Join-Path $GlobalSkills $_.Name

    if (Test-Path $Destination) {
        Remove-Item $Destination -Recurse -Force
    }

    Copy-Item $_.FullName -Destination $Destination -Recurse -Force
    Write-Host "  OK  $($_.Name)"
}

Write-Host ""
Write-Host "Installation complete."
Write-Host ""
Write-Host "Agents: $CodexAgents"
Write-Host "Skills: $GlobalSkills"
Write-Host ""
Write-Host "Restart Codex to load the installed configuration."