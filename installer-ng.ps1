if (!(Test-Path $profile)){
    New-Item -path $profile -typr file -force
    cp Profiles\Microsoft.PowerShell_profile.ps1 C:\Users\$env:UserName\Documents\WindowsPowerShell\
    Write-Host "[+] Copied profile"
}
else{
    Write-Host "Directory Exists"
    cp Profiles\Microsoft.PowerShell_profile.ps1 C:\Users\$env:UserName\Documents\WindowsPowerShell\
    Write-Host "[+] Copied profile" 
}

$os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match ‘(x64)’

if ($os_type -eq "True") {
    Write-Host "[+] Installin 64bit tools..."
    cd Win_Dev
    Start-Process ./Git-2.11.0.3-64-bit.exe -Wait
    Start-Process ./python-3.4.4.amd64.msi -Wait
    Start-Process ./pycrypto-2.6.1.win-amd64-py3.4.exe -Wait
    Start-Process ./pywin32-219.win-amd64-py3.4.exe -Wait
    Start-Process ./wix310.exe -Wait
    cd ..
    Write-Host "[+] Finished installing 64bit tools..."
    }
else {
    $os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match ‘(x86)’

    if ($os_type -eq "True") {
        Write-Host "[+] Installing 32bit tools..." 
        cd Win_Dev
        Start-Process ./Git-2.11.0.3-32-bit.exe -Wait
        Start-Process ./python-3.4.4.msi -Wait
        Start-Process ./pycrypto-2.6.1.win32-py3.4.exe -Wait
        Start-Process ./pywin32-220.win32-py3.4.exe -Wait
        Start-Process ./wix310.exe -Wait
        cd ..
        Write-Host "[+] Finished Installing 32bit tools..."
    }
}

Write-Host "[+] Enjoy your new Windows Dev environment..."


 Write-Host " "
Write-Host " "
Start-Sleep -m 80
Write-Host "@@@ @@@   @@@@@@        @@@  @@@  @@@@@@@@@@   @@@@@@@    @@@@@@   "
Start-Sleep -m 80
Write-Host "@@@ @@@  @@@@@@@@       @@@  @@@  @@@@@@@@@@@  @@@@@@@@  @@@@@@@@  "
Start-Sleep -m 100
Write-Host "@@! !@@  @@!  @@@       @@!  @@!  @@! @@! @@!  @@!  @@@  @@!  @@@  "
Start-Sleep -m 100
Write-Host "!@! @!!  !@!  @!@       !@!  !@!  !@! !@! !@!  !@   @!@  !@!  @!@  "
Start-Sleep -m 120
Write-Host " !@!@!   @!@  !@!       !!@  !!@  @!! !!@ @!@  @!@!@!@   @!@  !@!  "
Start-Sleep -m 120
Write-Host "  @!!!   !@!  !!!       !!!  !!!  !@!   ! !@!  !!!@!!!!  !@!  !!!  "
Start-Sleep -m 200
Write-Host "  !!:    !!:  !!!       !!:  !!:  !!:     !!:  !!:  !!!  !!:  !!!  "
Start-Sleep -m 240
Write-Host "  :!:    :!:  !:!  !!:  :!:  :!:  :!:     :!:  :!:  !:!  :!:  !:!  "
Start-Sleep -m 280
Write-Host "   ::    ::::: ::  ::: : ::   ::  :::     ::    :: ::::  ::::: ::  "
Start-Sleep -m 300
Write-Host "   :      : :  :    : :::    :     :      :    :: : ::    : :  :   "
Start-Sleep -m 340
Write-Host " "
Start-Sleep -m 380
Write-Host " "
Start-Sleep -m 400
