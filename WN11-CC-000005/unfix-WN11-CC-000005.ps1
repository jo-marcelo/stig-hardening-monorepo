# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$name = "NoLockScreenCamera"

If (Test-Path $registryPath) {
    # Removing the property acts as a non-compliant state (default Windows behavior without the policy)
    Remove-ItemProperty -Path $registryPath -Name $name -ErrorAction SilentlyContinue
    Write-Host "Reverted: $name removed from $registryPath. You are now vulnerable to WN11-CC-000005." -ForegroundColor Red
} else {
    Write-Host "The registry path does not exist. Nothing to revert." -ForegroundColor Yellow
}
