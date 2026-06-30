<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000030.
.NOTES
Author : Joao Miranda
Date Created : 06-30-2026
Version : 1.0
STIG-ID : WN11-AC-000030
Documentation : https://stigaview.com/products/win11/v2r7/WN11-AC-000030
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Ensure Minimum Password Age is configured to at least 1 day
Write-Host "Enforcing WN11-AC-000030: Setting Minimum Password Age to 1 day..." -ForegroundColor Cyan
net accounts /minpwage:1

Write-Host "Compliance applied. Validating current state:" -ForegroundColor Green
net accounts | Select-String "Minimum password age"
