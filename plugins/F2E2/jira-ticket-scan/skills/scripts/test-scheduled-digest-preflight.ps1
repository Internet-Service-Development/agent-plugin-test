[CmdletBinding()]
param(
  [string]$WorkingDirectory = "",
  [string]$CopilotCommand = "copilot",
  [string]$Model = "gpt-5.2",
  [switch]$SkipCopilotSmoke,
  [switch]$SkipJiraMcpSmoke
)

$ErrorActionPreference = "Stop"

$failures = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Write-CheckOk {
  param([Parameter(Mandatory)][string]$Message)

  Write-Host "[OK] $Message"
}

function Write-CheckWarn {
  param([Parameter(Mandatory)][string]$Message)

  $script:warnings.Add($Message)
  Write-Warning $Message
}

function Write-CheckFail {
  param([Parameter(Mandatory)][string]$Message)

  $script:failures.Add($Message)
  Write-Host "[FAIL] $Message" -ForegroundColor Red
}

function Test-RequiredCommand {
  param([Parameter(Mandatory)][string]$Name)

  $command = Get-Command $Name -ErrorAction SilentlyContinue
  if (-not $command) {
    Write-CheckFail "Required command not found: $Name"
    return $null
  }

  Write-CheckOk "Command found: $Name -> $($command.Source)"
  return $command
}

function Get-OsLocale {
  $candidateNames = @("LC_ALL", "LC_MESSAGES", "LANGUAGE", "LANG")

  foreach ($name in $candidateNames) {
    $value = [Environment]::GetEnvironmentVariable($name, "Process")
    if ($value) {
      return @{
        Name = $name
        Value = $value
      }
    }
  }

  try {
    $culture = [System.Globalization.CultureInfo]::CurrentUICulture.Name
    if ($culture) {
      return @{
        Name = "CurrentUICulture"
        Value = $culture
      }
    }
  } catch {
    return $null
  }

  return $null
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$skillsRoot = Split-Path -Parent $skillRoot
$pluginRoot = Split-Path -Parent $skillsRoot
$pluginsRoot = Split-Path -Parent $pluginRoot
$repoRoot = Split-Path -Parent $pluginsRoot

if (-not $WorkingDirectory) {
  $WorkingDirectory = $repoRoot
}

Write-Host "Jira scheduled digest preflight"
Write-Host "WorkingDirectory: $WorkingDirectory"
Write-Host "SkillRoot: $skillRoot"

$pwshCommand = Get-Command pwsh -ErrorAction SilentlyContinue
if ($pwshCommand) {
  Write-CheckOk "PowerShell command found: pwsh -> $($pwshCommand.Source)"
} else {
  $windowsPowerShellCommand = Get-Command powershell.exe -ErrorAction SilentlyContinue
  if ($windowsPowerShellCommand) {
    Write-CheckOk "PowerShell command found: powershell.exe -> $($windowsPowerShellCommand.Source)"
  } else {
    Write-CheckFail "No supported PowerShell executable found: pwsh or powershell.exe"
  }
}

$copilot = Test-RequiredCommand -Name $CopilotCommand

$locale = Get-OsLocale
if (-not $locale) {
  Write-CheckWarn "Locale could not be determined; skill should fall back to zh-TW."
} elseif ($locale.Value -match '^(C|POSIX)(\.UTF-8)?$') {
  Write-CheckWarn "Locale is generic ($($locale.Name)=$($locale.Value)); skill should fall back to zh-TW."
} else {
  Write-CheckOk "Locale candidate found: $($locale.Name)=$($locale.Value)"
}

if ($copilot -and -not $SkipCopilotSmoke) {
  Write-Host "Running Copilot CLI smoke test..."

  $copilotHelpOutput = & $CopilotCommand --help 2>&1
  if ($LASTEXITCODE -eq 0) {
    Write-CheckOk "Copilot CLI help command succeeded."
  } else {
    Write-CheckFail "Copilot CLI help command failed with exit code $LASTEXITCODE. Output: $($copilotHelpOutput -join ' ')"
  }
}

if ($copilot -and -not $SkipJiraMcpSmoke) {
  Write-Host "Running Jira MCP smoke test through Copilot..."

  $jiraPrompt = @"
Preflight check only.
Use the configured Jira MCP tools to run a read-only Jira issue search with maxResults=1.
Do not create, update, transition, or comment on any issue.
If the Jira tool returns JSON containing success=true, the Jira MCP search succeeded, even when zero issues are returned.
If the Jira MCP search succeeds, reply exactly: JIRA_MCP_PREFLIGHT_OK
If it fails, reply exactly: JIRA_MCP_PREFLIGHT_FAILED followed by the shortest useful reason.
"@

  $jiraOutput = & $CopilotCommand --model $Model -p $jiraPrompt --allow-all 2>&1
  $jiraText = $jiraOutput -join "`n"
  $jiraToolSucceeded = $jiraText -match 'jira_searchIssues' -and $jiraText -match '"success"\s*:\s*true'

  if ($LASTEXITCODE -ne 0) {
    Write-CheckFail "Jira MCP smoke test command failed with exit code $LASTEXITCODE. Output: $jiraText"
  } elseif ($jiraText -match 'JIRA_MCP_PREFLIGHT_OK' -or $jiraToolSucceeded) {
    Write-CheckOk "Jira MCP smoke test succeeded."
  } else {
    Write-CheckFail "Jira MCP smoke test did not return success marker. Output: $jiraText"
  }
}

if ($warnings.Count -gt 0) {
  Write-Host ""
  Write-Host "Warnings: $($warnings.Count)"
}

if ($failures.Count -gt 0) {
  Write-Host ""
  Write-Host "Preflight failed:"
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }

  exit 1
}

Write-Host ""
Write-Host "Preflight passed."
