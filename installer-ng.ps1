# Windows Power Shell
# If running installer-ng.ps1 fails you might need to set permissions
# to allow scripts to run. To do that enter the following:
# Set-ExecutionPolicy -ExecutionPolicy Unlimited
# or 
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned


if ( !(Test-Path $profile)){
    Write-Host "[+] Creating Windows PowerShell profile..."
    New-Item -path $profile -type file –force
    cp Microsoft.PowerShell_profile.ps1 C:\Users\$env:UserNmae\Documents\WindowsPowerShell\
}
else{
    Write-Host "[+] Users PowerShell profile exists..."
    cp Profiles\Microsoft.PowerShell_profile.ps1 C:\Users\$env:UserNmae\Documents\WindowsPowerShell\
    Write-Host "[+] Replacec old Microsoft.PowerShell_profile with shiny new one..."
}
                                          
Write-Host "[+] Enjoy your new PowerShell..."

Write-Host "__  __     _____________           ______          "
Write-Host "_ \/ /___________(_)__(_)______ ______  /_______   "
Write-Host "__  /_  __ \____  /__  /__  __ `__ \_  __ \  __ \  "
Write-Host "_  / / /_/ /___  / _  / _  / / / / /  /_/ / /_/ /  "
Write-Host "/_/  \____/___  /  /_/  /_/ /_/ /_//_.___/\____/   "
Write-Host "           /___/                                   "
Write-Host "________                        __________         "
Write-Host "__  ___/______________  ___________(_)_  /_____  __"
Write-Host "_____ \_  _ \  ___/  / / /_  ___/_  /_  __/_  / / /"
Write-Host "____/ //  __/ /__ / /_/ /_  /   _  / / /_ _  /_/ / "
Write-Host "/____/ \___/\___/ \__,_/ /_/    /_/  \__/ _\__, /  "
Write-Host "                                          /____/   "
Write-Host "_____   ______       ________                      "
Write-Host "___  | / /__(_)____________(_)_____ _              "
Write-Host "__   |/ /__  /__  __ \____  /_  __ `/              "
Write-Host "_  /|  / _  / _  / / /___  / / /_/ /               "
Write-Host "/_/ |_/  /_/  /_/ /_/___  /  \__,_/                "
Write-Host "                     /___/                         "
