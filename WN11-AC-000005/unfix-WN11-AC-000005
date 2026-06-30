<#
.SYNOPSIS
This PowerShell script reverts WN11-AC-000005 to force a compliance failure for lab testing.
.NOTES
Author : Joao Miranda
Version : 1.1
#>

Write-Host "Reverting Account Lockout settings to a non-compliant state (5 minutes)..." -ForegroundColor Yellow

# Fixes Error 87 by modifying both parameters inline so the constraint (Duration >= Window) is never violated!
net accounts /lockoutwindow:5 /lockoutduration:5

# Verify the broken setting
Write-Host "`nVerification of non-compliant local account settings:" -ForegroundColor Red
net accounts
