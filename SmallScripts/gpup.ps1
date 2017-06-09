Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

# copy bat and xml files to root
xcopy "E:\_Scripts\Misc\gpup.bat" C:\
xcopy "D:\_Scripts\Misc\gpup.bat" C:\

# run GPUpdate, wait for process to stop
Start-Process C:\gpup.bat -Wait

# clean up
Remove-Item -Path C:\gpup.bat

# exit here
Write-Host "Press any key to exit . . ."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Exit