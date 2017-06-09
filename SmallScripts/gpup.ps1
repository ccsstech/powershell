# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# copy bat and xml files to root
xcopy "E:\_Scripts\Misc\gpup.bat" C:\
xcopy "D:\_Scripts\Misc\gpup.bat" C:\

# run GPUpdate, wait for process to stop
Start-Process C:\gpup.bat -Wait

# clean up
Remove-Item -Path C:\gpup.bat

# exit
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
Exit
