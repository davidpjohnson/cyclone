set-location c:
$Shell.WindowTitle=”Yojimbo Security Ninja"
$Shell = $Host.UI.RawUI
$size = $Shell.WindowSize
$size.width=140
$size.height=50
$Shell.WindowSize = $size
$size = $Shell.BufferSize
$size.width=700
$size.height=50000
$Shell.BufferSize = $size
$shell.BackgroundColor = “Black”
$shell.ForegroundColor = "Green”
new-item alias:cl -value clear
$env:Path += ";C:\python34"
$env:Path += ";C:\'Program Files'\Git"
Clear-Host