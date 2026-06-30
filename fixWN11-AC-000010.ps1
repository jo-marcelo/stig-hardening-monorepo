<#
.SYNOPSIS
This PowerShell script implements the DISA STIG configuration for WN11-AC-000010.
.NOTES
Author : Joao Miranda
Date Created : 2026-06-30
Version : 1.0
STIG-ID : WN11-AC-000010
Documentation : https://stigaview.com/products/win11/v2r7/WN11-AC-000010
.USAGE
Run this script inside an elevated Administrative PowerShell console to enforce compliance.
#>

Write-Output "Enforcing Account Lockout Threshold to 3 attempts..."

# Account policies are system-wide environments managed natively via net accounts or secedit
net accounts /lockoutthreshold:3

Write-Output "Compliance configuration successfully applied!"
