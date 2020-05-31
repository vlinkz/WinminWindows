@echo off
GOTO EndComment
<!--*************************************************
Created using Windows AFG found at:
;http://www.windowsafg.com

Installation Notes
Location: 
Notes: Enter your comments here...
**************************************************-->
:EndComment
@echo off
echo Now configuring Windows Features.
dism /Online /Disable-Feature /FeatureName:"DirectPlay" /NoRestart
dism /Online /Disable-Feature /FeatureName:"FaxServicesClientPackage" /NoRestart
dism /Online /Enable-Feature /FeatureName:"Internet-Explorer-Optional-x64" /NoRestart
dism /Online /Disable-Feature /FeatureName:"LegacyComponents" /NoRestart
dism /Online /Enable-Feature /FeatureName:"MediaPlayback" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Microsoft-Hyper-V-All" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Microsoft-Hyper-V-Management-Clients" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Microsoft-Hyper-V-Management-PowerShell" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Microsoft-Hyper-V-Tools-All" /NoRestart
dism /Online /Enable-Feature /FeatureName:"Printing-Foundation-Features" /NoRestart
dism /Online /Enable-Feature /FeatureName:"Printing-Foundation-InternetPrinting-Client" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-LPDPrintService" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-LPRPortMonitor" /NoRestart
dism /Online /Enable-Feature /FeatureName:"Printing-PrintToPDFServices-Features" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Printing-XPSServices-Features" /NoRestart
dism /Online /Disable-Feature /FeatureName:"ScanManagementConsole" /NoRestart
dism /Online /Enable-Feature /FeatureName:"SearchEngine-Client-Package" /NoRestart
dism /Online /Disable-Feature /FeatureName:"TelnetClient" /NoRestart
dism /Online /Disable-Feature /FeatureName:"TFTP" /NoRestart
dism /Online /Disable-Feature /FeatureName:"TIFFIFilter" /NoRestart
dism /Online /Enable-Feature /FeatureName:"WindowsMediaPlayer" /NoRestart
dism /Online /Disable-Feature /FeatureName:"WorkFolders-Client" /NoRestart
dism /Online /Disable-Feature /FeatureName:"Xps-Foundation-Xps-Viewer" /NoRestart
echo Windows Features have now been configured.
@echo off
