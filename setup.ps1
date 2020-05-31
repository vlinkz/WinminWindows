If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}

Set-ExecutionPolicy Unrestricted

$url = "https://download.sysinternals.com/files/PSTools.zip"
$output = "C:\Users\VM\Documents\PSTools.zip"
Invoke-WebRequest -Uri $url -OutFile $output

Expand-Archive -LiteralPath "C:\Users\VM\Documents\PSTools.zip" -DestinationPath "C:\Program Files\sysinternals\" -Force

Remove-Item path "C:\Users\VM\Documents\PSTools.zip"

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/startps.bat"
$output = "C:\Program Files\sysinternals\startps.bat"
Invoke-WebRequest -Uri $url -OutFile $output

$url = "https://raw.githubusercontent.com/vlinkz/Windows10Debloater/master/Windows10SysPrepDebloater.ps1"
$output = "C:\Users\VM\Documents\Windows10SysPrepDebloater.ps1"
Invoke-WebRequest -Uri $url -OutFile $output
& "C:\Users\VM\Documents\Windows10SysPrepDebloater.ps1"

$url = "https://raw.githubusercontent.com/W4RH4WK/Debloat-Windows-10/master/scripts/disable-windows-defender.ps1"
$output = "C:\Users\VM\Documents\disable-windows-defender.ps1"
Invoke-WebRequest -Uri $url -OutFile $output
& "C:\Users\VM\Documents\disable-windows-defender.ps1"

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/"
$output = "C:\Users\VM\Documents\features.bat"
Invoke-WebRequest -Uri $url -OutFile $output
& "C:\Users\VM\Documents\features.bat"

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/"
$output = "C:\Users\VM\Documents\power.bat"
Invoke-WebRequest -Uri $url -OutFile $output
& "C:\Users\VM\Documents\power.bat"

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/"
$output = "C:\Users\VM\Documents\services.bat"
Invoke-WebRequest -Uri $url -OutFile $output
& "C:\Users\VM\Documents\services.bat"


setx /M path "$env:PATH;C:\Program Files\sysinternals;C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon"

New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -Value "VM"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -Value "vm"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "1"  -PropertyType "String"

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d " " /f
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /t REG_DWORD /d "1" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d "1" /f

$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'
$v=(Get-ItemProperty -Path $p).Settings
$v[8]=3
Set-ItemProperty -Path $p -Name Settings -Value $v

dism /Online /Add-Capability /CapabilityName:Windows.Desktop.EMS-SAC.Tools~~~~0.0.1.0 /NoRestart
bcdedit /emssettings EMSPORT:1 EMSBAUDRATE:115200
bcdedit /ems ON

$url = "https://raw.githubusercontent.com/vlinkz/WinminWindows/master/ooshutup10.cfg"
$output = "C:\Users\VM\Documents\ooshutup10.cfg"

Invoke-WebRequest -Uri $url -OutFile $output

$url = "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
$output = "C:\Users\VM\Documents\OOSU10.exe"

Invoke-WebRequest -Uri $url -OutFile $output

& "C:\Users\VM\Documents\OOSU10.exe" "C:\Users\VM\Documents\ooshutup10.cfg" /nosrp /quiet

Stop-Process -f -ProcessName explorer
