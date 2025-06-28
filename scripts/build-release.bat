@echo off
setlocal enabledelayedexpansion

REM Build script for MKM PACS Cockpit Application
set VERSION=1.0.0
set NAME=cockpit-mkm-pacs
set RELEASE_DIR=release
set DIST_DIR=dist

echo Building MKM PACS Cockpit Application v%VERSION%

REM Clean previous builds
if exist %RELEASE_DIR% rmdir /s /q %RELEASE_DIR%
if exist %DIST_DIR% rmdir /s /q %DIST_DIR%

REM Install dependencies
call npm install

REM Build the application
call npm run build

REM Create release directory
mkdir %RELEASE_DIR%

REM Copy built files
xcopy /E /I /Y %DIST_DIR% %RELEASE_DIR%\%NAME%

REM Copy additional files
copy README.md %RELEASE_DIR%\%NAME%\
copy manifest.json %RELEASE_DIR%\%NAME%\

REM Create installation script
echo @echo off > %RELEASE_DIR%\install.bat
echo setlocal enabledelayedexpansion >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo echo === MKM PACS Cockpit Application Installer === >> %RELEASE_DIR%\install.bat
echo echo. >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo REM Check if running as administrator >> %RELEASE_DIR%\install.bat
echo net session ^>nul 2^>^&1 >> %RELEASE_DIR%\install.bat
echo if %%errorLevel%% neq 0 ^( >> %RELEASE_DIR%\install.bat
echo     echo ❌ This script must be run as Administrator >> %RELEASE_DIR%\install.bat
echo     echo Usage: Right-click and "Run as administrator" >> %RELEASE_DIR%\install.bat
echo     pause >> %RELEASE_DIR%\install.bat
echo     exit /b 1 >> %RELEASE_DIR%\install.bat
echo ^) >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo REM Check if dist directory exists >> %RELEASE_DIR%\install.bat
echo if not exist "cockpit-mkm-pacs" ^( >> %RELEASE_DIR%\install.bat
echo     echo ❌ Build files not found >> %RELEASE_DIR%\install.bat
echo     pause >> %RELEASE_DIR%\install.bat
echo     exit /b 1 >> %RELEASE_DIR%\install.bat
echo ^) >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo echo ✅ Build files found >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo REM Create Cockpit directory if it doesn't exist >> %RELEASE_DIR%\install.bat
echo if not exist "C:\Program Files\Cockpit" mkdir "C:\Program Files\Cockpit" >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo REM Copy files >> %RELEASE_DIR%\install.bat
echo echo 📁 Installing MKM PACS to C:\Program Files\Cockpit\mkm-pacs... >> %RELEASE_DIR%\install.bat
echo xcopy /E /I /Y cockpit-mkm-pacs "C:\Program Files\Cockpit\mkm-pacs" >> %RELEASE_DIR%\install.bat
echo. >> %RELEASE_DIR%\install.bat
echo echo. >> %RELEASE_DIR%\install.bat
echo echo ✅ Installation completed successfully! >> %RELEASE_DIR%\install.bat
echo echo. >> %RELEASE_DIR%\install.bat
echo echo 🌐 Access Cockpit at: https://localhost:9090 >> %RELEASE_DIR%\install.bat
echo echo 📋 Look for 'MKM PACS' in the menu >> %RELEASE_DIR%\install.bat
echo echo. >> %RELEASE_DIR%\install.bat
echo echo 📖 Default API endpoint: http://localhost:7070 >> %RELEASE_DIR%\install.bat
echo echo ⚙️  You can change server settings in the web interface >> %RELEASE_DIR%\install.bat
echo echo. >> %RELEASE_DIR%\install.bat
echo echo 🔄 To uninstall, delete: C:\Program Files\Cockpit\mkm-pacs >> %RELEASE_DIR%\install.bat
echo echo. >> %RELEASE_DIR%\install.bat
echo pause >> %RELEASE_DIR%\install.bat

REM Create uninstall script
echo @echo off > %RELEASE_DIR%\uninstall.bat
echo setlocal enabledelayedexpansion >> %RELEASE_DIR%\uninstall.bat
echo. >> %RELEASE_DIR%\uninstall.bat
echo echo === MKM PACS Cockpit Application Uninstaller === >> %RELEASE_DIR%\uninstall.bat
echo echo. >> %RELEASE_DIR%\uninstall.bat
echo. >> %RELEASE_DIR%\uninstall.bat
echo REM Check if running as administrator >> %RELEASE_DIR%\uninstall.bat
echo net session ^>nul 2^>^&1 >> %RELEASE_DIR%\uninstall.bat
echo if %%errorLevel%% neq 0 ^( >> %RELEASE_DIR%\uninstall.bat
echo     echo ❌ This script must be run as Administrator >> %RELEASE_DIR%\uninstall.bat
echo     echo Usage: Right-click and "Run as administrator" >> %RELEASE_DIR%\uninstall.bat
echo     pause >> %RELEASE_DIR%\uninstall.bat
echo     exit /b 1 >> %RELEASE_DIR%\uninstall.bat
echo ^) >> %RELEASE_DIR%\uninstall.bat
echo. >> %RELEASE_DIR%\uninstall.bat
echo REM Remove files >> %RELEASE_DIR%\uninstall.bat
echo echo 🗑️  Removing MKM PACS from C:\Program Files\Cockpit\mkm-pacs... >> %RELEASE_DIR%\uninstall.bat
echo if exist "C:\Program Files\Cockpit\mkm-pacs" rmdir /s /q "C:\Program Files\Cockpit\mkm-pacs" >> %RELEASE_DIR%\uninstall.bat
echo. >> %RELEASE_DIR%\uninstall.bat
echo echo ✅ Uninstallation completed successfully! >> %RELEASE_DIR%\uninstall.bat
echo echo. >> %RELEASE_DIR%\uninstall.bat
echo pause >> %RELEASE_DIR%\uninstall.bat

REM Create tarball using PowerShell
powershell -Command "Compress-Archive -Path '%RELEASE_DIR%\*' -DestinationPath '%RELEASE_DIR%\%NAME%-%VERSION%.zip' -Force"

echo.
echo Release package created: %RELEASE_DIR%\%NAME%-%VERSION%.zip
echo Contents:
dir %RELEASE_DIR% 