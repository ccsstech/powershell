# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# ping gadoe
$isInternetConnected = Test-Connection -Quiet "www.gadoe.org";

# if internet
if ($isInternetConnected){
    Write-Host "Internet connected."

    # save ccboe\tss credentials to var
    $cred = New-Object System.Management.Automation.PsCredential("ccboe\tss", (ConvertTo-SecureString "1234567" -AsPlainText -Force))

    # drop to workgroup, prompt to reboot
    Add-Computer –DomainName "CCBOE.local" –Credential $cred

    # restart computer
    Set-ExecutionPolicy restricted CurrentUser
    Set-ExecutionPolicy restricted
    #Restart-Computer
    Pause
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
