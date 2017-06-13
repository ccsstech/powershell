# save password for ccboetech
$cred = New-Object System.Management.Automation.PsCredential("ccboe\tss", (ConvertTo-SecureString "1234567" -AsPlainText -Force))

# add ccboetech to admin
Start-Process C:\tech.bat
Write-Host "The TECH-DEPT group has been added to the local administrators group."

# clean up files
Invoke-Expression C:\gpup.ps1

