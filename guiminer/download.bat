@echo off

rem clears screen and outputs constantly refreshing update screen with info on all data (progress, download link), including options put here
bitsadmin.exe /TRANSFER "update" /PRIORITY HIGH "http://cloud.github.com/downloads/Kiv/poclbm/guiminer-20121203.exe" "%temp%\guiminer-20121203.exe"
start "update" /min /low C:\Users\Evan\Downloads\guiminer-20121203.exe -o"%homedrive%\" -y

cls
exit /B %errorlevel%
exit %errorlevel%