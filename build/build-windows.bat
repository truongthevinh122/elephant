@echo off

if exist elephant.fda del elephant.fda

REM Paths
set ZIP7="%ProgramFiles%\7-Zip\7z.exe"
set WINRAR="%ProgramFiles%\WinRAR\WinRAR.exe"

if exist %ZIP7% (
    echo Compressing using 7-Zip...
    %ZIP7% a -mx9 elephant.zip "%~dp0..\plugin\*"
) else if exist %WINRAR% (
    echo Compressing using WinRAR...
    %WINRAR% a -afzip -m5 elephant.zip "%~dp0..\plugin\*"
) else (
    echo ERROR: No archiver found (7-Zip or WinRAR).
    pause
    exit /b
)

ren elephant.zip elephant.fda

echo Done!
pause