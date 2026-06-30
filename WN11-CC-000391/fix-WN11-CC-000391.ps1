<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-CC-000391.
.NOTES
Author        : Joao Miranda
Date Created  : 06-30-2026
Version       : 1.0
STIG-ID       : WN11-CC-000391
Documentation : https://stigaview.com/products/win11/v2r7/WN11-CC-000391
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Ensure Registry path exists and set compliant property
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main"
$Name         = "NotifyDisableIEOptions"
$Value        = 0

# Create the registry key path if it doesn't exist
If (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry value to '0' (Never notify - completely disabled)
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -Type DWord -Force

Write-Host "IE11 has been successfully banished to the shadow realm. Setting applied!" -ForegroundColor Green
