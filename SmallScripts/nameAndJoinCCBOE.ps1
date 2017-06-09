Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

# ping gadoe
$isInternetConnected = Test-Connection -Quiet "www.gadoe.org";

# if internet
if ($isInternetConnected){
    # get computer name
    $computerName = Read-Host -Prompt 'Input the computer name'

    # save password for ccboetech
    $cred = New-Object System.Management.Automation.PsCredential("ccboe\tss", (ConvertTo-SecureString "1234567" -AsPlainText -Force))

    $ErrorActionPreference = "Stop"

    # try to join domain, don't rename or join if there is an error
    $contScript = $True

    Try{
        # join to domain
        Add-Computer -NewName $computerName -DomainName "CCBOE.local" -Credential $cred
        Write-Host "$computerName has been joined to the domain."

        # restart computer
        Write-Host "Press any key to reboot. . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Restart-Computer
    }
    Catch{
        Write-Host "ERROR: $env:computername could not be named.  Try rerunning the script."
        $contScript = $False

        # exit here
        Write-Host "Press any key to exit . . ."
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Exit
    }
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