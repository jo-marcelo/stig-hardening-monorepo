<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-CC-000065.
.NOTES
Author : Joao Miranda
Date Created : 2026-06-30
Version : 1.0
STIG-ID : WN11-CC-000065
Documentation : https://stigaview.com/products/win11/v2r7/WN11-CC-000065
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Ensure Registry path exists and set compliant property
$registryPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
$name = "AutoConnectAllowedOEM"
$value = 0

# Create the registry path if it does not exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "Created registry path: $registryPath"
}

# Apply the STIG fix
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord -Force
Write-Host "Compliance Enforced: Set $name to $value at $registryPath" -ForegroundColor Green
