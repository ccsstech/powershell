# remove initial policy prompt
Set-ExecutionPolicy unrestricted CurrentUser

# ping gadoe
$isInternetConnected = Test-Connection -Quiet "www.gadoe.org";

# if internet
if ($isInternetConnected){
    Write-Host "Internet connected."

    $abb = ($env:COMPUTERNAME).Substring(1,3)
    $domcontroller = ""

    # build Kaseya path
    # $c = -join($a,$b)
    $boe = "BAE","EES","EMS","EHS"
    $gbh = "GBH","GBM","GBE","NCE","RMS","RES","PES"
    $gth = "BPE","BWE","CMS","GTH","LES","WES"
    $hhs = "CAS","CRE","ECE","GTE","GTM","HHS","HMS","NHE"
    $lms = "BRE","LHS","LMS","MES","SCE","SIM","STC"

    # validate
    if ($boe -contains $abb){
        $domcontroller = "boe"
    }
    elseif ($gbh -contains $abb){
        $domcontroller = "gbh"
    }
    elseif ($gth -contains $abb){
        $domcontroller = "gth"
    }
    elseif ($hhs -contains $abb){
        $domcontroller = "hhs"
    }
    elseif ($lms -contains $abb){
        $domcontroller = "lms"
    }

    # string manipulation to build paths
    $path = "\\boeasdc"
    $path = -join($path,$domcontroller)
    $domainController = ($path).Substring(2,10) # strip backslashes to save name
    $kasper = -join($path,"\KLSHARE\Packages\NetAgent")
    $kaseya = -join($path,"\NETLOGON\KaseyaInstallScripts\")
    $kaseya = -join($kaseya,$abb.ToLower())
    $kaseya = -join($kaseya,".bat")
    #Write-Host $domainController # remove for release
    #Write-Host $kasper # remove for release
    #Write-Host $kaseya # remove for release

    # initialize remote PowerShell session on DC to copy files to local machine
    $cred = New-Object System.Management.Automation.PsCredential("CCBOE\tss", (ConvertTo-SecureString "1234567" -AsPlainText -Force))
    $domainControllerSession = New-PSSession -Authentication Kerberos -ComputerName $domainController -Credential $cred
    Copy-Item -FromSession $domainControllerSession -Path $kaseya -Destination "C:\"
    Copy-Item -FromSession $domainControllerSession -Path $kasper -Destination "C:\NetAgent" -Recurse

    # clean up files
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
