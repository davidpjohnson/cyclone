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

