Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

# copy bat file to root
xcopy "E:\_Scripts\Misc\rCCSD.bat" C:\
xcopy "D:\_Scripts\Misc\rCCSD.bat" C:\

Start-Process C:\rCCSD.bat -Wait

# clean up files
Remove-Item -path C:\rCCSD.bat