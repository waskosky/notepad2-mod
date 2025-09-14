@echo off
rem Simple wrapper to build Notepad2-mod into an .exe with one command.
rem Usage examples:
rem   build             -> Rebuild both x86 and x64 Release
rem   build x64         -> Rebuild x64 Release
rem   build x86 Debug   -> Rebuild x86 Debug
rem   build Clean all   -> Clean all configs (x86 + x64)

setlocal enableextensions
cd /d "%~dp0\build"

set ACTION=Rebuild
set ARCH=all
set CONFIG=Release

if not "%~1"=="" set ACTION=%~1
if not "%~2"=="" set ARCH=%~2
if not "%~3"=="" set CONFIG=%~3

call "build_vs2017.bat" %ACTION% %ARCH% %CONFIG%
if errorlevel 1 goto :err

cd /d "%~dp0"
echo.
echo Build completed.
echo Outputs:
if /i "%ARCH%"=="x64" (
  echo   bin\VS2017\%CONFIG%_x64\Notepad2.exe
) else if /i "%ARCH%"=="x86" (
  echo   bin\VS2017\%CONFIG%_x86\Notepad2.exe
) else (
  echo   bin\VS2017\%CONFIG%_x86\Notepad2.exe
  echo   bin\VS2017\%CONFIG%_x64\Notepad2.exe
)
echo.
goto :eof

:err
echo.
echo [ERROR] Build failed.
exit /b 1

