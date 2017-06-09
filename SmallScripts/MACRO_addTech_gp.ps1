Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

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
Exit