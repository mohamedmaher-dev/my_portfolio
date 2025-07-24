#!/bin/bash

# Flutter Web Portfolio Build Script
# This script builds the Flutter web app and moves it to the deployment directory

echo "🚀 Building Flutter Web Portfolio..."
echo "=================================="

# Build the Flutter web app for production
echo "📦 Building Flutter web app..."
flutter build web --release

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Flutter build completed successfully!"
    
    # Remove existing web files in the target directory
    echo "🧹 Cleaning target web directory..."
    rm -rf ../web/*
    
    # Copy built files to the web directory
    echo "📂 Copying build files to web directory..."
    cp -r build/web/* ../web/
    
    echo "✅ Build completed successfully!"
    echo "📁 Web files are now in: /web/"
    echo "🌐 Ready for deployment!"
    echo ""
    echo "To test locally, serve the /web directory with any HTTP server:"
    echo "  cd ../web && python3 -m http.server 8000"
    echo "  or"
    echo "  cd ../web && npx serve ."
    
else
    echo "❌ Flutter build failed!"
    exit 1
fi 