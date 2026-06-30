<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-CC-000005.
.NOTES
Author : Joao Miranda
Date Created : 06-30-2026
Version : 1.0
STIG-ID : WN11-CC-000005
Documentation : https://stigaview.com/products/win11/v2r7/WN11-CC-000005
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Ensure Registry path exists and set compliant property
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$name = "NoLockScreenCamera"
$value = 1

# Check if the registry path exists; if not, create it
If (!(Test-Path $registryPath)) {
    Write-Host "Path does not exist, creating $registryPath..." -ForegroundColor Yellow
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry property to enforce the STIG rule
Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWord -Force
Write-Host "STIG WN11-CC-000005 Enforced: $name has been set to $value in $registryPath" -ForegroundColor Green
