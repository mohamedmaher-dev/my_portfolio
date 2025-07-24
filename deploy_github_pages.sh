#!/bin/bash

# GitHub Pages Deployment Script for Flutter Portfolio
# This script builds the Flutter web app and deploys it to GitHub Pages

set -e  # Exit on any error

echo "🚀 Starting GitHub Pages Deployment..."
echo "======================================"

# Navigate to portfolio directory
cd portfolio

# 1. Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# 2. Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# 3. Build web for production
echo "🔨 Building Flutter web app..."
flutter build web --release

# Navigate back to root
cd ..

# 4. Clean web directory
echo "🗑️ Cleaning web directory..."
rm -rf web/*

# 5. Copy build to web directory
echo "📂 Copying build files..."
cp -r portfolio/build/web/. web/

# 6. Clean portfolio build directory
echo "🧹 Cleaning portfolio build directory..."
rm -rf portfolio/build/

# 7. Add and commit changes
echo "📝 Committing changes..."
git add .
git commit -m "Deploy: Updated web build for GitHub Pages"

# 8. Push to master
echo "⬆️ Pushing to master..."
git push origin master

# 9. Deploy to GitHub Pages using subtree
echo "🌐 Deploying to GitHub Pages..."
git subtree push --prefix web origin gh-pages

echo "✅ Deployment completed successfully!"
echo "🌍 Your site should be available at:"
echo "    https://mohamedmaher-dev.github.io/my_portfolio/"
echo ""
echo "📋 Next steps:"
echo "   1. Go to your GitHub repository settings"
echo "   2. Navigate to Pages section"
echo "   3. Set source to 'Deploy from a branch'"
echo "   4. Select 'gh-pages' branch and '/ (root)' folder"
echo "   5. Save and wait for deployment" 