1) This script is interactive, don't just run it and walk away.

3) This is dependent upon 3 files being at the root of C of the computer you are setting up:
	tech.bat
	ccsd.xml
	ccsd.bat
-> This script will handle copying these files from the flash drive to the root of C, as well as clean up

2) To run, right click "init.ps1" and click "run with PowerShell"

2) If it asks if you wish to change a security policy, exit the shell and rerun the script.

4) This script will fully automate the initial setup (up to the first reboot), so make sure you have no errors when you enter the computer name.
-> It only takes a few seconds for the whole thing to run; so again, double check the computer name before you press return.

5) If the shell exits without rebooting the computer, it has joined it to the domain but failed to change the name
-> You will have to drop it into WORKGROUP, change the name, and bring it into CCBOE.local manually (or with the other scripts)