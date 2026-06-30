<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000035.
.NOTES
Author          : Joao Miranda
Date Created    : 06-30-2026
Version         : 1.0
STIG-ID         : WN11-AC-000035
Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000035
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Enforce the minimum password length to 14 characters via the Security Accounts Manager
Write-Host "[*] Enforcing STIG WN11-AC-000035: Setting minimum password length to 14 characters..." -ForegroundColor Cyan

try {
    net accounts /minpwlen:14
    Write-Host "[+] Remediation successful. Minimum password length is now 14." -ForegroundColor Green
}
catch {
    Write-Host "[-] Failed to apply remediation. Ensure you are running as Administrator." -ForegroundColor Red
}
