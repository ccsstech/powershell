# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# copy bat file to root
xcopy "E:\_Scripts\Misc\rCCSD.bat" C:\
xcopy "D:\_Scripts\Misc\rCCSD.bat" C:\

Start-Process C:\rCCSD.bat -Wait

# clean up files
Remove-Item -path C:\rCCSD.bat
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
