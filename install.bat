@echo off
setlocal enabledelayedexpansion

echo === MKM PACS Cockpit Application Installer ===
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ This script must be run as Administrator
    echo Usage: Right-click and "Run as administrator"
    pause
    exit /b 1
)

REM Check if dist directory exists
if not exist "dist" (
    echo ❌ Build files not found. Please run 'npm run build' first.
    pause
    exit /b 1
)

echo ✅ Build files found

REM Create Cockpit directory if it doesn't exist
if not exist "C:\Program Files\Cockpit" mkdir "C:\Program Files\Cockpit"

REM Copy files
echo 📁 Installing MKM PACS to C:\Program Files\Cockpit\mkm-pacs...
xcopy /E /I /Y dist "C:\Program Files\Cockpit\mkm-pacs"

echo.
echo ✅ Installation completed successfully!
echo.
echo 🌐 Access Cockpit at: https://localhost:9090
echo 📋 Look for 'MKM PACS' in the menu
echo.
echo 📖 Default API endpoint: http://localhost:7070
echo ⚙️  You can change server settings in the web interface
echo.
echo 🔄 To uninstall, delete: C:\Program Files\Cockpit\mkm-pacs
echo.
pause 