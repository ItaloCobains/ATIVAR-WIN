@echo off




: =================================================================
:  This script is a part of 'Microsoft Activation Scripts'
:  Maintained by @WindowsAddict
:  Homepage - https://www.nsaneforums.com/topic/316668--/
: =================================================================






::========================================================================================================================================

cls
title Oficina do pc
for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G
set "ErrLine=echo. &call :Color 0C "==== ERROR ====" &echo:&echo."
setlocal EnableDelayedExpansion
call :Color_Pre

::========================================================================================================================================

: ===========================================================
:  Check if the file path name contains special characters
:  https://stackoverflow.com/a/33626625
:  Written by @jeb (stackoverflow)
:  Thanks to @abbodi1406 (MDL) for the help.
: ===========================================================

setlocal
setlocal DisableDelayedExpansion
set "param=%~f0"
cmd /v:on /c echo(^^!param^^!| findstr /R "[| ` ~ ! @ %% \^ & ( ) \[ \] { } + = ; ' , |]*^"
endlocal
if %errorlevel% EQU 0 (
%ErrLine%
echo Disallowed special characters detected in file path name.
echo Make sure file path name do not have following special characters,
echo ^` ^~ ^! ^@ %% ^^ ^& ^( ^) [ ] { } ^+ ^= ^; ^' ^,
goto MASend
)

::========================================================================================================================================

if %winbuild% LSS 7600 (
%ErrLine%
echo Unsupported OS version Detected.
echo Project is supported only for Windows 7/8/8.1/10 and their Server equivalent.
goto MASend
)

::========================================================================================================================================

: ================================================
:  Self-elevate passing args and preventing loop
:  Written by @AveYo aka @BAU
: ================================================

setlocal
reg query HKEY_USERS\S-1-5-20 1>nul 2>nul && goto GotPrivileges_1
If "%ElevError%"=="Y" goto Elev_Err_1
set "args="%~f0" %*" & call set "args=%%args:"=\"%%"
echo Initializing...
powershell -c "start cmd -ArgumentList '/c set ElevError=Y& call %args%' -verb runas" && exit /b

:Elev_Err_1
%ErrLine%
echo Right click on this file and select 'Run as administrator'
goto MASend

:GotPrivileges_1
endlocal

:======================================================================================================================================================


Color F0
title Oficina do PC
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                               ----------------------------------------------------------- 
echo.
echo                                              Ativar Windows 10 Gratuito
echo.
echo                               ----------------------------------------------------------- 
echo.
echo.
echo                                               Ativar Sem Ativadores
echo                                            HD Virtual Windows 10 Brasil
echo                                                    Top Windows
... (4 MB restante(s))
