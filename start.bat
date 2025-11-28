@echo off
setlocal

rem Serve the app from the repo root, preferring Node for auto-open, then Python.
cd /d "%~dp0"

where npx >nul 2>&1
if %errorlevel%==0 (
  npx -y http-server -o
  exit /b %errorlevel%
)

where py >nul 2>&1
if %errorlevel%==0 (
  py -m http.server 8080
  exit /b %errorlevel%
)

where python >nul 2>&1
if %errorlevel%==0 (
  python -m http.server 8080
  exit /b %errorlevel%
)

echo No Python or Node found. You can:
echo   1^) Install Node: https://nodejs.org
echo   2^) Install Python: https://python.org/downloads/ (check "Add Python to PATH" on Windows)
echo   3^) Install the XMLUI CLI: https://github.com/xmlui-org/cli
exit /b 1
