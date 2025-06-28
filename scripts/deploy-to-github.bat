@echo off
setlocal enabledelayedexpansion

echo === MKM PACS GitHub Deployment ===
echo.

REM Check if git is installed
git --version >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ Git is not installed. Please install Git first.
    echo Download from: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Check if .git directory exists
if not exist ".git" (
    echo 🔧 Initializing git repository...
    git init
)

REM Add all files
echo 📁 Adding files to git...
git add .

REM Create commit
echo 💾 Creating commit...
git commit -m "feat: Initial release of MKM PACS Cockpit application

- Add health monitoring for PACS server
- Add system metrics display
- Add server configuration interface
- Add comprehensive documentation
- Add build and deployment scripts"

REM Setup remote (if not already configured)
git remote get-url origin >nul 2>&1
if %errorLevel% neq 0 (
    echo 🔗 Setting up remote origin...
    git remote add origin https://github.com/medakadem/cockpit-mkm-pacs.git
)

REM Check if main branch exists
git show-ref --verify --quiet refs/heads/main
if %errorLevel% neq 0 (
    echo 🌿 Creating main branch...
    git branch -M main
)

REM Push to GitHub
echo 🚀 Pushing to GitHub...
git push -u origin main

echo.
echo ✅ Successfully pushed to GitHub!
echo 🌐 Repository: https://github.com/medakadem/cockpit-mkm-pacs
echo.
echo 📋 Next steps:
echo 1. Go to https://github.com/medakadem/cockpit-mkm-pacs
echo 2. Create first release: npm run release
echo 3. Upload file from release/ to GitHub Releases
echo 4. Share the repository link
echo.
pause 