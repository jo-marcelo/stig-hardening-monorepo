# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.

$registryPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
$name = "AutoConnectAllowedOEM"
$value = 1

# Create the registry path if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Rollback the STIG fix to trigger a scan failure
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord -Force
Write-Host "Reverted: Set $name to $value at $registryPath. You are now vulnerable!" -ForegroundColor Yellow
