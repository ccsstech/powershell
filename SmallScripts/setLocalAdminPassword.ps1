# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# change password
([adsi]"WinNT://$env:COMPUTERNAME/Administrator").SetPassword("DontG1veThis@ut")

# exit here
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
Exit
