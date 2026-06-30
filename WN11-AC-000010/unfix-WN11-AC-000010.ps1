<#
.SYNOPSIS
This PowerShell script reverts the DISA STIG configuration for WN11-AC-000010 to force a scan failure.
.NOTES
Author : Joao Miranda
Date Created : 2026-06-30
Version : 1.0
STIG-ID : WN11-AC-000010
.USAGE
Run this script inside an elevated Administrative PowerShell console for lab testing purposes.
#>

Write-Output "Disabling Account Lockout Threshold (setting to 0) to simulate vulnerability..."

# Setting the threshold to 0 allows infinite bad password attempts
net accounts /lockoutthreshold:0

Write-Output "System successfully reverted to a non-compliant state. Ready for Tenable baseline scan."
