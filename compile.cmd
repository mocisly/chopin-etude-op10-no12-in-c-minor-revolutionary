@echo off
setlocal
chcp 65001 >nul
cd /d "%~dp0"
where lilypond >nul 2>nul
if errorlevel 1 (
  echo LilyPond was not found. Install LilyPond 2.26.0 and add it to PATH.
  exit /b 1
)
if not exist "build" mkdir "build"
lilypond -o "build\chopin-etude-op10-no12-in-c-minor-revolutionary" "chopin-etude-op10-no12-in-c-minor-revolutionary.ly" >"build\compile.log" 2>&1
set "RESULT=%ERRORLEVEL%"
type "build\compile.log"
exit /b %RESULT%
