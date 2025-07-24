@echo off
REM Flutter Web Portfolio Build Script for Windows
REM This script builds the Flutter web app and moves it to the deployment directory

echo 🚀 Building Flutter Web Portfolio...
echo ==================================

REM Build the Flutter web app for production
echo 📦 Building Flutter web app...
flutter build web --release

if %errorlevel% equ 0 (
    echo ✅ Flutter build completed successfully!
    
    REM Remove existing web files in the target directory
    echo 🧹 Cleaning target web directory...
    if exist "..\web\*" del /q "..\web\*"
    if exist "..\web" for /d %%x in ("..\web\*") do rd /s /q "%%x"
    
    REM Copy built files to the web directory
    echo 📂 Copying build files to web directory...
    xcopy "build\web\*" "..\web\" /e /i /y
    
    echo ✅ Build completed successfully!
    echo 📁 Web files are now in: \web\
    echo 🌐 Ready for deployment!
    echo.
    echo To test locally, serve the \web directory with any HTTP server:
    echo   cd ..\web ^&^& python -m http.server 8000
    echo   or
    echo   cd ..\web ^&^& npx serve .
    
) else (
    echo ❌ Flutter build failed!
    exit /b 1
) 