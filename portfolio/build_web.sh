#!/bin/bash

# Flutter Web Portfolio Build Script
# This script builds the Flutter web app and moves it to the deployment directory

echo "🚀 Building Flutter Web Portfolio..."
echo "=================================="

# Check if Flutter is available
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed or not in PATH"
    exit 1
fi

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Check if pub get was successful
if [ $? -ne 0 ]; then
    echo "❌ Failed to get dependencies!"
    exit 1
fi

# Build the Flutter web app for production with optimizations
echo "📦 Building Flutter web app with optimizations..."
flutter build web \
    --release \
    --dart-define=FLUTTER_WEB_USE_SKIA=true \
    --dart-define=FLUTTER_WEB_AUTO_DETECT=true

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Flutter build completed successfully!"
    
    # Remove existing web files in the target directory
    echo "🧹 Cleaning target web directory..."
    rm -rf ../web/*
    
    # Create web directory if it doesn't exist
    mkdir -p ../web
    
    # Copy built files to the web directory
    echo "📂 Copying build files to web directory..."
    cp -r build/web/* ../web/
    
    # Verify files were copied
    if [ -f "../web/index.html" ]; then
        echo "✅ Build completed successfully!"
        echo "📁 Web files are now in: /web/"
        echo "🌐 Ready for deployment!"
        echo ""
        echo "To test locally, serve the /web directory with any HTTP server:"
        echo "  cd ../web && python3 -m http.server 8000"
        echo "  or"
        echo "  cd ../web && npx serve ."
        echo ""
        echo "Build summary:"
        echo "  - Main app size: $(du -h ../web/main.dart.js 2>/dev/null | cut -f1 || echo 'Unknown')"
        echo "  - Total build size: $(du -sh ../web 2>/dev/null | cut -f1 || echo 'Unknown')"
    else
        echo "❌ Build files were not copied successfully!"
        exit 1
    fi
    
else
    echo "❌ Flutter build failed!"
    echo "💡 Try running 'flutter doctor' to check your Flutter installation"
    exit 1
fi 