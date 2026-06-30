<#
.SYNOPSIS
Run this script to revert the setting back to its non-compliant state for Tenable scan testing.
#>

Write-Host "Reverting bad logon counter reset window to 5 minutes (Non-Compliant)..." -ForegroundColor Yellow

# Setting the window to 5 minutes intentionally violates the minimum 15-minute requirement
net accounts /lockoutwindow:5

if ($LASTEXITCODE -eq 0) {
    Write-Host "[!] System is now vulnerable to WN11-AC-000015. Ready for Tenable baseline scan." -ForegroundColor Red
}
