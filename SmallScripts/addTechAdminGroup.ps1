# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# copy bat and xml files to root
xcopy "E:\_Scripts\Misc\tech.bat" C:\
xcopy "D:\_Scripts\Misc\tech.bat" C:\

# ping gadoe
$isInternetConnected = Test-Connection -Quiet "www.gadoe.org";

# if internet
if ($isInternetConnected){
    Write-Host "Internet connected."

    # save password for ccboetech
    $cred = New-Object System.Management.Automation.PsCredential("ccboe\tss", (ConvertTo-SecureString "1234567" -AsPlainText -Force))

    # add ccboetech to admin
    Start-Process C:\tech.bat
    Write-Host "The TECH-DEPT group has been added to the local administrators group."
    Write-Host "Press any key to continue. . ."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    # clean up files
    Remove-Item -Path C:\tech.bat
    Set-ExecutionPolicy restricted CurrentUser
    Set-ExecutionPolicy restricted
    Exit
}
else {

    # If wireless adapter
    if (Get-NetAdapter -Name "Wi-Fi"){
        Write-Host "ERROR: Check wireless settings."

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	    Set-ExecutionPolicy restricted CurrentUser
	    Set-ExecutionPolicy restricted
        Exit
    }

    # If ethernet adapter
    elseif (Get-NetAdapter -Name "Ethernet"){
        Write-Host "ERROR: Check network cable."

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	    Set-ExecutionPolicy restricted CurrentUser
	    Set-ExecutionPolicy restricted
        Exit
    }

    # If adapter not recognized
    else {
        Write-Host "ERROR: An unknown error occurred."

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	    Set-ExecutionPolicy restricted CurrentUser
	    Set-ExecutionPolicy restricted
        Exit
    }
}
Set-ExecutionPolicy restricted CurrentUser
Set-ExecutionPolicy restricted
