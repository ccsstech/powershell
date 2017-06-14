
# internet, rename
# joinCCBOE
# addTechAdminGroup, gpup
# finish

# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# copy ALL necessary scripts
xcopy "E:\_Scripts\Misc\tech.bat" C:\
xcopy "E:\_Scripts\Misc\ccsd.xml" C:\
xcopy "E:\_Scripts\Misc\ccsd.bat" C:\
xcopy "E:\_Scripts\Misc\gpup.bat" C:\
xcopy "E:\_Scripts\AutoSetup\dl\addTechAdminGroup.ps1" C:\
xcopy "E:\_Scripts\AutoSetup\dl\rename.ps1" C:\
xcopy "E:\_Scripts\AutoSetup\dl\connectToInternet.ps1" C:\
xcopy "E:\_Scripts\AutoSetup\dl\gpup.ps1" C:\
xcopy "E:\_Scripts\AutoSetup\dl\joinCCBOE.ps1" C:\
xcopy "E:\_Scripts\AutoSetup\dl\finish.ps1" C:\
xcopy "D:\_Scripts\Misc\tech.bat" C:\
xcopy "D:\_Scripts\Misc\ccsd.xml" C:\
xcopy "D:\_Scripts\Misc\ccsd.bat" C:\
xcopy "D:\_Scripts\Misc\gpup.bat" C:\
xcopy "D:\_Scripts\AutoSetup\dl\addTechAdminGroup.ps1" C:\
xcopy "D:\_Scripts\AutoSetup\dl\rename.ps1" C:\
xcopy "D:\_Scripts\AutoSetup\dl\connectToInternet.ps1" C:\
xcopy "D:\_Scripts\AutoSetup\dl\gpup.ps1" C:\
xcopy "D:\_Scripts\AutoSetup\dl\joinCCBOE.ps1" C:\
xcopy "D:\_Scripts\AutoSetup\dl\finish.ps1" C:\

# create RunOnce registry key
New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion -Name RunOnce -Force

# change RunOnce registry key
Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce
New-ItemProperty . MyKey -propertytype String -value "Powershell C:\addTechAdminGroup.ps1"

# setup network
Invoke-Expression C:\connectToInternet.ps1

# rename
Invoke-Expression C:\joinCCBOE.ps1

# exit here
Restart-Computer