@ECHO OFF
start psexec64 -u vm -p vm -d -i 1 cmd.exe /C start "" /MAX %1 %2
