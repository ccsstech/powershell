Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

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

    # clean up files
    Remove-Item -Path C:\tech.bat
    
    # exit here
    Write-Host "Press any key to exit . . ."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}
else {

    # If wireless adapter
    if (Get-NetAdapter -Name "Wi-Fi"){
        Write-Host "ERROR: Check wireless settings."

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Exit
    }

    # If ethernet adapter
    elseif (Get-NetAdapter -Name "Ethernet"){
        Write-Host "ERROR: Check network cable."

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Exit
    }

    # If adapter not recognized
    else {
        Write-Host "ERROR: An unknown error occurred."

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Exit
    }
}