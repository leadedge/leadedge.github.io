rem
rem Installation of Spout2 plugin for OBS Studio portable
rem
@echo off
Pushd "%~dp0"
cls
rem
title Spout2 plugin install for OBS Studio portable
echo Spout2 plugin install for OBS Studio portable
rem
rem Find a zip file starting with "win-spout"
rem
echo.
for %%F in (win-spout*.zip) do (
    set "ZIP=%%F"
    goto :found
)
echo No Spout2 plugin zip file with a name beginning with "win-spout" found.
echo Download the latest Spout2 Plugin zip file for OBS
echo from "https://github.com/Off-World-Live/obs-spout2-plugin/releases"
echo (e.g. win-spout-1.9.0-windows-x64.zip)
echo and copy it to the OBS portable root folder.
echo.
echo     bin
echo     config
echo     data
echo     obs-plugins
echo portable-mode.txt
echo spout2-OBS-portable-install.bat    
echo ---- Copy to here ----
echo.
set /p OPEN=Download it now? (y/n): 
if /i "%OPEN%"=="y" start "" "https://github.com/Off-World-Live/obs-spout2-plugin/releases"
echo.
goto end
rem
rem extract the zip file to create a "win-spout" folder
rem
:found
echo Extracting zip file (%ZIP%)
tar -xf %ZIP%
echo.
rem
rem copy the contents of “win-spout/bin/64bit” to “obs-plugins/64bit”
echo Copying the contents of 'win-spout/bin/64bit' to 'obs-plugins/64bit'
xcopy "%~dp0win-spout\bin\64bit\*" "%~dp0obs-plugins\64bit\" /E /Y /I
echo.
rem copy the contents of “win-spout/data” to “data/obs-plugins/win-spout/”
echo Copying the contents of 'win-spout/data' to 'data/obs-plugins/win-spout/'
xcopy "%~dp0win-spout\data\*" "%~dp0data\obs-plugins\win-spout\" /E /Y /I
echo.
rem
rem Remove the extracted folder
rmdir /S /Q "win-spout"
rem
echo Spout2 plugin install complete
echo Start OBS studio from "bin\64bit\obs64.exe"
echo.
rem
rem Leave the console open to show errors or progress
pause
:end
rem



