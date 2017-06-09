Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

# get computer name
$computerName = Read-Host -Prompt 'Input the computer name'
Rename-Computer -NewName $computerName -Restart