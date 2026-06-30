<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000015.
.NOTES
Author        : Joao Miranda
Date Created  : 06-30-2026
Version       : 1.0
STIG-ID       : WN11-AC-000015
Documentation : https://stigaview.com/products/win11/v2r7/WN11-AC-000015
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Ensure the lockout threshold is set first, otherwise the window command might throw an error.
# (Windows requires a threshold > 0 for a lockout window to exist).
net accounts /lockoutthreshold:3 | Out-Null

# Enforce the bad logon counter reset time to 15 minutes
Write-Host "Configuring the bad logon counter reset window to 15 minutes..." -ForegroundColor Cyan
net accounts /lockoutwindow:15

if ($LASTEXITCODE -eq 0) {
    Write-Host "[✓] Compliance successfully applied for WN11-AC-000015." -ForegroundColor Green
} else {
    Write-Warning "[!] Failed to apply configuration. Ensure you are running as an Administrator."
}
