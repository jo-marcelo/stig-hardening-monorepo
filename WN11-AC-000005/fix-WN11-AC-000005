<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000005.
.NOTES
Author : Joao Miranda
Date Created : 2026-06-30
Version : 1.1
STIG-ID : WN11-AC-000005
Documentation : https://stigaview.com/products/win11/v2r7/WN11-AC-000005
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

Write-Host "Enforcing compliant STIG configurations..." -ForegroundColor Cyan

# Enforce Account Lockout Duration (15 mins) and Observation Window (15 mins)
# Note: Order or simultaneous execution matters due to Windows security dependencies
net accounts /lockoutduration:15 /lockoutwindow:15

# Verify settings
Write-Host "`nVerification of local account settings:" -ForegroundColor Green
net accounts
