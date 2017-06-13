# get computer name
$computerName = Read-Host -Prompt 'Input the computer name'
Rename-Computer -NewName $computerName
Restart-Computer
