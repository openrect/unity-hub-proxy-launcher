@echo off
setlocal EnableExtensions

set "SCRIPT_NAME=%~nx0"

if /I "%~1"=="-h" goto :usage
if /I "%~1"=="--help" goto :usage
if /I "%~1"=="/?" goto :usage

set "DEFAULT_PROXY=http://127.0.0.1:7890"
set "DEFAULT_NO_PROXY=localhost,127.0.0.1,::1"
set "DEFAULT_UNITY_HUB=%ProgramFiles%\Unity Hub\Unity Hub.exe"

set "PROXY=%~1"
if not defined PROXY if defined UNITY_HUB_PROXY set "PROXY=%UNITY_HUB_PROXY%"
if not defined PROXY set "PROXY=%DEFAULT_PROXY%"

set "UNITY_HUB=%~2"
if not defined UNITY_HUB if defined UNITY_HUB_PATH set "UNITY_HUB=%UNITY_HUB_PATH%"
if not defined UNITY_HUB set "UNITY_HUB=%DEFAULT_UNITY_HUB%"

set "NO_PROXY_LIST=%UNITY_HUB_NO_PROXY%"
if not defined NO_PROXY_LIST set "NO_PROXY_LIST=%DEFAULT_NO_PROXY%"

if not exist "%UNITY_HUB%" (
  echo Unity Hub was not found.
  echo.
  echo Expected path:
  echo   %UNITY_HUB%
  echo.
  echo Pass a custom path as the second argument or set UNITY_HUB_PATH.
  exit /b 2
)

set "HTTP_PROXY=%PROXY%"
set "HTTPS_PROXY=%PROXY%"
set "http_proxy=%PROXY%"
set "https_proxy=%PROXY%"
set "NO_PROXY=%NO_PROXY_LIST%"
set "no_proxy=%NO_PROXY_LIST%"
set "UNITY_NOPROXY=%NO_PROXY_LIST%"

echo Starting Unity Hub with proxy:
echo   %PROXY%
echo Unity Hub:
echo   %UNITY_HUB%

start "" "%UNITY_HUB%" --proxy-server="%PROXY%"
exit /b %ERRORLEVEL%

:usage
echo Unity Hub Proxy Launcher
echo.
echo Usage:
echo   %SCRIPT_NAME% [proxy_url] [unity_hub_exe_path]
echo.
echo Arguments:
echo   proxy_url            Proxy server URL. Default: http://127.0.0.1:7890
echo   unity_hub_exe_path   Path to Unity Hub.exe. Default: %%ProgramFiles%%\Unity Hub\Unity Hub.exe
echo.
echo Environment variables:
echo   UNITY_HUB_PROXY      Fallback proxy URL when proxy_url is omitted.
echo   UNITY_HUB_PATH       Fallback Unity Hub path when unity_hub_exe_path is omitted.
echo   UNITY_HUB_NO_PROXY   Comma-separated no-proxy hosts. Default: localhost,127.0.0.1,::1
exit /b 0
