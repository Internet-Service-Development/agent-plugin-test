[CmdletBinding()]
param(
  [string]$WorkingDirectory = ""
)

$ErrorActionPreference = "Stop"

$skillRoot = Split-Path -Parent $PSScriptRoot
$agentsRoot = Split-Path -Parent $skillRoot
$repoRoot = Split-Path -Parent $agentsRoot

if (-not $WorkingDirectory) {
  $WorkingDirectory = $repoRoot
}

Set-Location $WorkingDirectory

Write-Host "WorkingDirectory: $WorkingDirectory"
Write-Host 'Command: copilot --model gpt-5.2 -p "/jira-ticket-scan" --allow-all'

copilot --model gpt-5.2 -p "/jira-ticket-scan" --allow-all

if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
