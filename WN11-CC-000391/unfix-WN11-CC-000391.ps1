# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main"
$Name         = "NotifyDisableIEOptions"

If (Test-Path $RegistryPath) {
    # Remove the value to break compliance
    Remove-ItemProperty -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue
    Write-Host "IE11 stands resurrected. Your Tenable scan will now fail." -ForegroundColor Yellow
} else {
    Write-Host "Registry path not found. System is already non-compliant." -ForegroundColor Yellow
}
