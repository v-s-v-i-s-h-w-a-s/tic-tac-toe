@echo off
REM 🚀 Quick Release Script for Tic-Tac-Toe (Windows)
REM This script helps you create and publish a new version

setlocal enabledelayedexpansion

echo 🎮 Tic-Tac-Toe Release Helper
echo ==================================

REM Check if we're in the right directory
if not exist "pyproject.toml" (
    echo ❌ Error: pyproject.toml not found. Are you in the project root?
    exit /b 1
)

REM Get current version
for /f "tokens=3 delims= " %%a in ('findstr /r "^version" pyproject.toml') do set CURRENT_VERSION=%%a
set CURRENT_VERSION=%CURRENT_VERSION:"=%

echo 📋 Current version: %CURRENT_VERSION%

REM Ask for new version
set /p NEW_VERSION="📝 Enter new version (e.g., 0.1.1, 0.2.0, 1.0.0): "

if "%NEW_VERSION%"=="" (
    echo ❌ Version cannot be empty
    exit /b 1
)

echo 🔄 Updating version in pyproject.toml...

REM Update version in pyproject.toml
powershell -Command "(Get-Content pyproject.toml) -replace 'version = \"%CURRENT_VERSION%\"', 'version = \"%NEW_VERSION%\"' | Set-Content pyproject.toml"

echo ✅ Version updated to %NEW_VERSION%

REM Ask for release notes
set /p RELEASE_NOTES="📝 Enter release notes (or press Enter for default): "
if "%RELEASE_NOTES%"=="" set RELEASE_NOTES=Release version %NEW_VERSION%

echo 🔄 Committing version bump...
git add pyproject.toml
git commit -m "Bump version to %NEW_VERSION%"

echo 🔄 Creating and pushing tag...
git tag -a "v%NEW_VERSION%" -m "Release version %NEW_VERSION%"
git push origin develop
git push origin "v%NEW_VERSION%"

echo.
echo 🎉 Success! Release v%NEW_VERSION% created!
echo.
echo 📦 What happens next:
echo   1. GitHub Actions will build and publish to PyPI
echo   2. Docker image will be built and pushed to Docker Hub
echo   3. Check the Actions tab for progress
echo.
echo 🔗 Monitor your release:
echo   • GitHub: https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe/releases
echo   • PyPI: https://pypi.org/project/tictactoe-vish/
echo   • Docker Hub: https://hub.docker.com/r/vishwas812/tic-tac-toe
echo.
echo 🚀 Happy releasing!

pause
