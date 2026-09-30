@echo off
title Unitech - Site Local
cd /d "%~dp0"
start "" http://localhost:5500/index.html
node serve.js
echo.
echo O servidor parou.
pause
