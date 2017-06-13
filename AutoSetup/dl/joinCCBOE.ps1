# create RunOnce registry key
New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion -Name RunOnce -Force

# change RunOnce registry key
Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce
New-ItemProperty . MyKey -propertytype String -value "Powershell C:\addTechAdminGroup.ps1"

# save ccboe\tss credentials to var
$cred = New-Object System.Management.Automation.PsCredential("ccboe\tss", (ConvertTo-SecureString "1234567" -AsPlainText -Force))

# drop to workgroup, reboot
Add-Computer –DomainName "CCBOE.local" –Credential $cred
Restart-Computer