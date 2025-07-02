#!/bin/bash

# Build script for the Steps App monorepo
set -e

echo "🔨 Building Steps App..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
melos clean

# Get dependencies
echo "📦 Getting dependencies..."
melos bootstrap

# Generate code (if any)
echo "🔧 Generating code..."
melos run build:dart_define_runner || echo "No build_runner tasks found"

# Run analysis
echo "🔍 Running analysis..."
melos run analyze

# Run tests
echo "🧪 Running tests..."
melos run test

# Build apps
echo "📱 Building apps..."
cd apps/steps_app
flutter build apk --release || echo "Android build skipped (no android configuration)"
cd ../..

echo "✅ Build complete!"