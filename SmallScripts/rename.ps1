# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# get computer name
$computerName = Read-Host -Prompt 'Input the computer name'
Rename-Computer -NewName $computerName

Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
Restart-Computer
