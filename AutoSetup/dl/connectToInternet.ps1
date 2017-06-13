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
        Start-Process C:\ccsd.bat

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
	        Set-ExecutionPolicy restricted CurrentUser
	        Set-ExecutionPolicy restricted
            Exit
        }
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
