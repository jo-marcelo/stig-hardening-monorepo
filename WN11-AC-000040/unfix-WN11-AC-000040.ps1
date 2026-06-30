# Run this script to revert the setting back to its non-compliant state for Tenable scan testing.

$SecPolCfg = "$env:TEMP\secpol.cfg"
$SecPolDb  = "$env:windir\security\local.sdb"

# Export current security policy
secedit /export /cfg $SecPolCfg /quiet

# Modify the configuration file to disable complexity
(Get-Content $SecPolCfg) -replace "PasswordComplexity = 1", "PasswordComplexity = 0" | Set-Content $SecPolCfg

# Import the updated policy back into the system database
secedit /configure /db $SecPolDb /cfg $SecPolCfg /areas SECURITYPOLICY /quiet

# Clean up the temp file
Remove-Item -Path $SecPolCfg -Force

Write-Host "[!] STIG WN11-AC-000040 reversed: Password complexity is now DISABLED." -ForegroundColor Red
