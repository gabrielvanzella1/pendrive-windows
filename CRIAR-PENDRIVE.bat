@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0baixar.ps1"
if errorlevel 1 pause
if exist "%~dp0Win11_ptBR_x64.iso" (start "" "%~dp0rufus.exe" -i "%~dp0Win11_ptBR_x64.iso") else (start "" "%~dp0rufus.exe")
