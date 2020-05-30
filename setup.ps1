If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}


$url = "https://download.sysinternals.com/files/PSTools.zip"
$output = "C:\Users\VM\Documents\PSTools.zip"
Invoke-WebRequest -Uri $url -OutFile $output

Expand-Archive -LiteralPath "C:\Users\VM\Documents\PSTools.zip" -DestinationPath "C:\Program Files\sysinternals\" -Force

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/startps.bat"
$output = "C:\Program Files\sysinternals\startps.bat"

Invoke-WebRequest -Uri $url -OutFile $output

setx /M path $env:PATH;"C:\Program Files\sysinternals"

New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -Value "VM"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -Value "vm"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "1"  -PropertyType "String"


dism /Online /Add-Capability /CapabilityName:Windows.Desktop.EMS-SAC.Tools~~~~0.0.1.0 /NoRestart
bcdedit /emssettings EMSPORT:1 EMSBAUDRATE:115200
bcdedit /ems ON
