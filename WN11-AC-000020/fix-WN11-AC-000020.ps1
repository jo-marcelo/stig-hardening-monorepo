<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000020.
.NOTES
Author : Joao Miranda
Date Created : 06-30-2026
Version : 1.0
STIG-ID : WN11-AC-000020
Documentation : https://stigaview.com/products/win11/v2r7/WN11-AC-000020
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# While registry edits are the usual go-to, local security policies like password history 
# are best handled natively using 'net accounts' to directly update the SAM database.

Write-Host "Enforcing password history to 24 remembered passwords..." -ForegroundColor Cyan
net accounts /uniquepw:24

if ($LASTEXITCODE -eq 0) {
    Write-Host "Compliance applied successfully! The user is now securely annoyed." -ForegroundColor Green
} else {
    Write-Host "Failed to apply compliance." -ForegroundColor Red
}
