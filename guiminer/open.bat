pushd .
cd %homedrive%\guiminer
setlocal ENABLEDELAYEDEXPANSION
set i=%1
for /F %%G in ('%homedrive%\guiminer\poclbm.exe -q -d %i% evanmcc_aoe:1@stratum.btcguild.com:3333#btcguild evanmcc:d=1@mmpool.bitparking.com:3333#bitparking 1GPwFQ51uzwx1TuE4rYNo2VFahYvJKjw1c:1@stratum.mining.eligius.st:3334#eligus') do (set a=%%G)

echo %a%>stop.txt

popd

exit /B %errorlevel%
exit %errorlevel%