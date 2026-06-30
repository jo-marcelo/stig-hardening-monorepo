<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000040.
.NOTES
Author          : Joao Miranda
Date Created    : 06-30-2026
Version         : 1.0
STIG-ID         : WN11-AC-000040
Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000040
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

# Local Security Policies (like Password Complexity) don't live in a simple registry key.
# We use the built-in 'secedit' tool to export the policy, modify the PasswordComplexity flag, and import it back.

$SecPolCfg = "$env:TEMP\secpol.cfg"
$SecPolDb  = "$env:windir\security\local.sdb"

# Export current security policy
secedit /export /cfg $SecPolCfg /quiet

# Modify the configuration file to enforce complexity
(Get-Content $SecPolCfg) -replace "PasswordComplexity = 0", "PasswordComplexity = 1" | Set-Content $SecPolCfg

# Import the updated policy back into the system database
secedit /configure /db $SecPolDb /cfg $SecPolCfg /areas SECURITYPOLICY /quiet

# Clean up the temp file
Remove-Item -Path $SecPolCfg -Force

Write-Host "[*] STIG WN11-AC-000040 applied: Password complexity is now ENABLED." -ForegroundColor Green
