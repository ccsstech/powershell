Remove-Item -path C:\ccsd.bat
Remove-Item -path C:\ccsd.xml
Remove-Item -path C:\tech.bat
Remove-Item -path C:\addTechAdminGroup.ps1
Remove-Item -path C:\rename.ps1
Remove-Item -path C:\connectToInternet.ps1
Remove-Item -path C:\gpup.ps1
Remove-Item -path C:\joinCCBOE.ps1
Remove-Item -path C:\finish.ps1

# exit here
Write-Host "Script has completed!"
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
Pause