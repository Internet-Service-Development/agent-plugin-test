[CmdletBinding()]
param(
  [string]$TaskName = "Copilot Jira Daily Digest",
  [string]$At = "08:30",
  [string]$ScriptPath = "",
  [string]$WorkingDirectory = ""
)

$ErrorActionPreference = "Stop"

function Format-TaskArgument {
  param([Parameter(Mandatory)][string]$Value)

  if ($Value -notmatch '[\s"]') {
    return $Value
  }

  return '"' + ($Value -replace '"', '\"') + '"'
}

if (-not $ScriptPath) {
  $ScriptPath = Join-Path $PSScriptRoot "run-scheduled-digest.ps1"
}

if (-not (Test-Path $ScriptPath)) {
  throw "Scheduled digest script not found: $ScriptPath"
}

$powerShellCommand = Get-Command pwsh -ErrorAction SilentlyContinue
if (-not $powerShellCommand) {
  $powerShellCommand = Get-Command powershell.exe -ErrorAction Stop
}

$actionArguments = @(
  "-NoProfile",
  "-ExecutionPolicy",
  "Bypass",
  "-File",
  (Format-TaskArgument $ScriptPath)
)

if ($WorkingDirectory) {
  $actionArguments += @("-WorkingDirectory", (Format-TaskArgument $WorkingDirectory))
}

$triggerTime = [DateTime]::ParseExact($At, "HH:mm", [Globalization.CultureInfo]::InvariantCulture)
$action = New-ScheduledTaskAction `
  -Execute $powerShellCommand.Source `
  -Argument ($actionArguments -join " ")

$trigger = New-ScheduledTaskTrigger `
  -Weekly `
  -DaysOfWeek Monday, Tuesday, Wednesday, Thursday, Friday `
  -At $triggerTime

$settings = New-ScheduledTaskSettingsSet `
  -StartWhenAvailable `
  -MultipleInstances IgnoreNew `
  -ExecutionTimeLimit (New-TimeSpan -Hours 2)

$principal = New-ScheduledTaskPrincipal `
  -UserId ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name) `
  -LogonType Interactive `
  -RunLevel Limited

$description = "Runs GitHub Copilot CLI with the jira-ticket-scan skill and sends the daily Jira digest to Teams."

Register-ScheduledTask `
  -TaskName $TaskName `
  -Action $action `
  -Trigger $trigger `
  -Settings $settings `
  -Principal $principal `
  -Description $description `
  -Force | Out-Null

Write-Host "Registered scheduled task: $TaskName"
Write-Host "Schedule: Monday-Friday at $At"
Write-Host "Command: $($powerShellCommand.Source) $($actionArguments -join ' ')"
Write-Host "Run now: Start-ScheduledTask -TaskName '$TaskName'"
