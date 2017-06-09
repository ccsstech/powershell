﻿Set-ExecutionPolicy unrestricted
# remove initial policy prompt
# note: this doesn't always work for some reason, trying it again
Set-ExecutionPolicy unrestricted

# copy bat and xml files to root
xcopy "E:\_Scripts\Misc\tech.bat" C:\
xcopy "E:\_Scripts\Misc\ccsd.xml" C:\
xcopy "E:\_Scripts\Misc\ccsd.bat" C:\
xcopy "D:\_Scripts\Misc\tech.bat" C:\
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
}
Catch{
    Write-Host "ERROR: $env:computername could not be named.  Try rerunning the script."
    $contScript = $False

    # exit here
    Write-Host "Press any key to exit . . ."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

# check if try block threw; if not, add tech and reboot
if($contScript -eq $True){

    # add ccboetech to admin
    Start-Process C:\tech.bat
    Write-Host "The TECH-DEPT group has been added to the local administrators group."
    Write-Host "Press any key to reboot. . ."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    # clean up files
    Remove-Item -path C:\ccsd.bat
    Remove-Item -path C:\ccsd.xml
    Remove-Item -path C:\tech.bat

    Restart-Computer
}


