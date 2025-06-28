@echo off 
setlocal enabledelayedexpansion 
 
echo === MKM PACS Cockpit Application Uninstaller === 
echo. 
 
REM Check if running as administrator 
net session >nul 2>&1 
if %errorLevel% neq 0 ( 
    echo ❌ This script must be run as Administrator 
    echo Usage: Right-click and "Run as administrator" 
    pause 
    exit /b 1 
) 
 
REM Remove files 
echo 🗑️  Removing MKM PACS from C:\Program Files\Cockpit\mkm-pacs... 
if exist "C:\Program Files\Cockpit\mkm-pacs" rmdir /s /q "C:\Program Files\Cockpit\mkm-pacs" 
 
echo ✅ Uninstallation completed successfully 
echo. 
pause 
