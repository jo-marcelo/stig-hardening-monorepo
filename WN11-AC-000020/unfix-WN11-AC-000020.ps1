# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.

Write-Host "Reverting password history to 0 (non-compliant)..." -ForegroundColor Yellow
net accounts /uniquepw:0

if ($LASTEXITCODE -eq 0) {
    Write-Host "Reversal applied successfully! Tenable will now flag this as a vulnerability." -ForegroundColor Red
} else {
    Write-Host "Failed to revert compliance." -ForegroundColor Red
}
