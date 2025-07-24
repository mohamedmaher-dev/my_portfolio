#!/bin/bash

# GitHub Pages Deployment Script for Flutter Portfolio
# This script builds Flutter web app and deploys files directly to repository root

set -e  # Exit on any error

echo "🚀 Starting GitHub Pages Deployment (Root Mode)..."
echo "=================================================="

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

# 4. Clean existing web files from root
echo "🗑️ Cleaning existing web files from root..."
find . -maxdepth 1 -name "*.js" -o -name "*.html" -o -name "*.json" -o -name "*.png" | grep -E "\.(js|html|json|png)$" | xargs rm -f || true
rm -rf assets canvaskit icons flutter_service_worker.js .last_build_id version.json || true

# 5. Copy build files to root
echo "📂 Copying build files to root..."
cp -r portfolio/build/web/. .

# 6. Clean portfolio build directory
echo "🧹 Cleaning portfolio build directory..."
rm -rf portfolio/build/

# 7. Add and commit changes
echo "📝 Committing changes..."
git add .
git commit -m "Deploy: Updated web build for GitHub Pages (root deployment)"

# 8. Deploy to GitHub Pages
echo "🌐 Deploying to GitHub Pages..."
git push origin master:gh-pages --force

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
echo ""
echo "📝 Note: Web files are now deployed directly to the repository root" 