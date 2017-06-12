# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# copy scripts
xcopy "E:\_Scripts\SmallScripts\connectToInternet.ps1" C:\
xcopy "D:\_Scripts\SmallScripts\connectToInternet.ps1" C:\
xcopy "E:\_Scripts\SmallScripts\removeWifiProfile.ps1" C:\
xcopy "D:\_Scripts\SmallScripts\removeWifiProfile.ps1" C:\

# run scripts
Invoke-Expression C:\removeWifiProfile.ps1
Invoke-Expression C:\connectToInternet.ps1

# clean up
Remove-Item -Path C:\connectToInternet.ps1
Remove-Item -Path C:\removeWifiProfile.ps1

# exit here
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
Exit
