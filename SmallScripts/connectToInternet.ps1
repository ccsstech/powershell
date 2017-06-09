Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

# copy bat and xml files to root
xcopy "E:\_Scripts\Misc\ccsd.xml" C:\
xcopy "E:\_Scripts\Misc\ccsd.bat" C:\
xcopy "D:\_Scripts\Misc\ccsd.xml" C:\
xcopy "D:\_Scripts\Misc\ccsd.bat" C:\

# ping gadoe
$isInternetConnected = Test-Connection -Quiet "www.gadoe.org";

# if internet
if ($isInternetConnected){
    Write-Host "Internet connected."
}

# if no internet
else {
    # If wireless adapter
    if (Get-NetAdapter -Name "Wi-Fi"){
        Start-Process C:\ccsd.bat -Wait
        
        # ping gadoe
        $isInternetConnected = Test-Connection -Quiet "www.gadoe.org";

        # if internet
        if ($isInternetConnected){
            Write-Host "Internet connected."
        }
        else {
            Write-Host "ERROR: Check wireless settings."

            # exit here
            Write-Host "Press any key to exit . . ."
            $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            Exit
        }
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

# clean up files
Remove-Item -path C:\ccsd.bat
Remove-Item -path C:\ccsd.xml