# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.

Write-Host "[*] Rolling back WN11-AC-000035: Setting minimum password length to 0..." -ForegroundColor Yellow

try {
    net accounts /minpwlen:0
    Write-Host "[-] Rollback successful. The system is now vulnerable to short passwords. Run your Tenable scan!" -ForegroundColor DarkYellow
}
catch {
    Write-Host "[-] Failed to revert the policy." -ForegroundColor Red
}
