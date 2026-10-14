@echo off
setlocal

REM Change to the folder containing this script (so it works from login regardless of cwd)
pushd "%~dp0"

REM --- 1. KV calibration (runs through Git Bash's sh; requires Git for Windows installed)
scripts\make_kv_bias.sh

REM --- 2. Environment variables
set BONSAI_KV4=1
set BONSAI_CTX=55000

REM --- 3. Start the server with Process-scoped execution policy bypass
powershell -NoProfile -NoLogo -ExecutionPolicy Bypass -File "%~dp0scripts\start_llama_server.ps1"

endlocal