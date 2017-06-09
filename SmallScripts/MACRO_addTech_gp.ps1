# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# copy scripts
xcopy "E:\_Scripts\SmallScripts\gpup.ps1" C:\
xcopy "D:\_Scripts\SmallScripts\gpup.ps1" C:\
xcopy "E:\_Scripts\SmallScripts\addTechAdminGroup.ps1" C:\
xcopy "D:\_Scripts\SmallScripts\addTechAdminGroup.ps1" C:\

# run scripts
Invoke-Expression C:\addTechAdminGroup.ps1
Invoke-Expression C:\gpup.ps1

# clean up
Remove-Item -Path C:\gpup.ps1
Remove-Item -Path C:\addTechAdminGroup.ps1

# exit here
Write-Host "Press any key to exit . . ."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
Exit
