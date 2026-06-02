[CmdletBinding()]
param(
  [Parameter(Mandatory)]
  [string[]]$TargetUserEmail,

  [Parameter(Mandatory)][string]$DigestTitle,
  [string]$DigestMarkdown,
  [string]$DigestFile,
  [string]$JobName = "jira-ticket-scan-daily-digest",
  [string]$Assignee = "",
  [string]$DateRange = ""
)

if (-not $TargetUserEmail -or $TargetUserEmail.Count -eq 0) {
  Write-Error "TargetUserEmail is required."
  exit 1
}

$webhookUrl = 'https://default301f59c4c2694a668a8cf5daab211f.a3.environment.api.powerplatform.com:443/powerautomate/automations/direct/workflows/bb98d8efd7674c06bdd6d78284c4fc19/triggers/manual/paths/invoke?api-version=1&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=UvfDqRzaB3heFYq02vecybHZo5Bh_RSjJLmGno1T22g'
$targetEmails = @($TargetUserEmail)
$sentAt = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

if ($DigestFile) {
  if (-not (Test-Path $DigestFile)) {
    Write-Error "Digest file not found: $DigestFile"
    exit 1
  }

  $DigestMarkdown = Get-Content $DigestFile -Raw
}

if (-not $DigestMarkdown) {
  Write-Error "DigestMarkdown or DigestFile is required."
  exit 1
}

$payloadObject = @{
  jobName = $JobName
  targetUserEmail = $targetEmails
  title = $DigestTitle
  summary = $DigestMarkdown
  assignee = $Assignee
  dateRange = $DateRange
  sentAt = $sentAt
}

$payload = $payloadObject | ConvertTo-Json -Depth 5

try {
  Invoke-RestMethod `
    -Uri $webhookUrl `
    -Method Post `
    -Body $payload `
    -ContentType 'application/json; charset=utf-8'

  Write-Host "Teams notification sent"
} catch {
  Write-Error "Failed to send Teams notification: $_"
  exit 1
}
