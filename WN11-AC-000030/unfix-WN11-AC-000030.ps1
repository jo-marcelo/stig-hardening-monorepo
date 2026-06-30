# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.
Write-Host "Reverting WN11-AC-000030: Setting Minimum Password Age to 0 days (Failure condition)..." -ForegroundColor Yellow
net accounts /minpwage:0

Write-Host "Reversal applied. Validating current state:" -ForegroundColor Red
net accounts | Select-String "Minimum password age"
