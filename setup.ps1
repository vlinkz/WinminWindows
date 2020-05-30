#Requires -RunAsAdministrator

$url = "https://download.sysinternals.com/files/PSTools.zip"
$output = "C:\Users\VM\Documents\PSTools.zip"
Invoke-WebRequest -Uri $url -OutFile $output

Expand-Archive -LiteralPath "C:\Users\VM\Documents\PSTools.zip" -DestinationPath "C:\Program Files\sysinternals\" -Force

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/startps.bat"
$output = "C:\Program Files\sysinternals\startps.bat"

Invoke-WebRequest -Uri $url -OutFile $output
