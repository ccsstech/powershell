# run GPUpdate, wait for process to stop
Start-Process C:\gpup.bat -Wait

# exit
Invoke-Expression C:\finish.ps1
