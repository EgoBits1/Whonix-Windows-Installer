where /f /r c:\ iscc.exe > location.txt
@echo off &setlocal
(for /f "delims=" %%i in (location.txt) do (
set "line=%%i"
setlocal enabledelayedexpansion
set "line=!line:exe"=exe" Whonix.iss!"
echo(!line!
endlocal
))>"location.bat"
call location.bat
7za a Installer ./Output/
copy /b 7zSD.sfx + config.txt + Installer.7z "Install Whonix.exe"
