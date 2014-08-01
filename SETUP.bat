@echo off

rem the only potential use for this script is during setup; anything that would need admin should have it already (to avoid UAC prompts)

:getAdmin
rem assume gotAdmin if there are no arguments
if ("%1") EQU ("") goto gotAdmin
rem Check for Administrator privileges and request privileges if needed
rem NOTE: This will restart the script with Admin privileges
setlocal
set xAdmin=0
set xSuccess=1
set VBUAC=AdminUAC.vbs

rem Check for Access via "net session >nul 2>&1"
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"
if %ErrorLevel% EQU 0 ( set xAdmin=%xSuccess% & goto gotAdmin )

rem Execute UAC
if /i not "%xAdmin%"=="%xSuccess%" (
  echo Set UAC = CreateObject^("Shell.Application"^) > "%VBUAC%"
  echo UAC.ShellExecute "%~s0", "", "", "runas", 0 >> "%VBUAC%"
  if exist "%VBUAC%" (
    "%VBUAC%"
    del "%VBUAC%"
  )
)
endlocal & set "xReturn=%xAdmin%"

:gotAdmin
@echo off


start "update check" /MIN /LOW "cmd" "/Q /C "%WINDIR%\admin\clean_a.bat"

cls

exit /B %errorlevel%
exit %errorlevel%