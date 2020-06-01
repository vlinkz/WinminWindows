@ECHO OFF
::start psexec64 -u vm -p vm -d -accepteula -i 1 cmd.exe /C start "" /MAX %1 %2
schtasks /create /sc once /tn test /tr "cmd.exe /C start \"\" /MAX %1 %2" /ST 00:00
schtasks /run /i /TN test
schtasks /delete /tn test /F

