# Flutter Portfolio Makefile
# Quick commands for building and deploying the portfolio

.PHONY: help build-web deploy-web clean dev analyze

# Default target
help:
	@echo "📱 Flutter Portfolio Build Commands"
	@echo "=================================="
	@echo ""
	@echo "Available commands:"
	@echo "  make build-web    🚀 Build Flutter web app for production"
	@echo "  make deploy-web   🌐 Build and prepare for deployment"
	@echo "  make dev          🛠️  Run development server"
	@echo "  make analyze      🔍 Run code analysis"
	@echo "  make clean        🧹 Clean build files"
	@echo "  make help         ❓ Show this help message"

# Build web app for production
build-web:
	@echo "🚀 Building Flutter Web Portfolio..."
	@flutter build web --release
	@echo "✅ Build completed!"

# Build and deploy to web directory
deploy-web:
	@echo "🚀 Building and deploying Flutter Web Portfolio..."
	@flutter build web --release
	@echo "🧹 Cleaning target web directory..."
	@rm -rf ../web/*
	@echo "📂 Copying build files to web directory..."
	@cp -r build/web/* ../web/
	@echo "✅ Deployment completed!"
	@echo "📁 Web files are now in: ../web/"
	@echo "🌐 Ready for hosting!"

# Run development server
dev:
	@echo "🛠️ Starting development server..."
	@flutter run -d web-server --web-port 3000

# Run code analysis
analyze:
	@echo "🔍 Running code analysis..."
	@dart analyze

# Clean build files
clean:
	@echo "🧹 Cleaning build files..."
	@flutter clean
	@rm -rf ../web/*
	@echo "✅ Clean completed!"

# Install dependencies
deps:
	@echo "📦 Installing dependencies..."
	@flutter pub get
	@echo "✅ Dependencies installed!" 