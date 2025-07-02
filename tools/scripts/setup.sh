#!/bin/bash

# Setup script for the Steps App monorepo
set -e

echo "🚀 Setting up Steps App Monorepo..."

# Check if mise is installed
if ! command -v mise &> /dev/null; then
    echo "❌ mise is not installed. Please install it first:"
    echo "   curl https://mise.jdx.dev/install.sh | sh"
    exit 1
fi

# Check if Flutter is available
if ! command -v flutter &> /dev/null && ! mise which flutter &> /dev/null; then
    echo "⚠️  Flutter not found. Installing via mise..."
    mise install flutter
fi

# Check if melos is installed
if ! command -v melos &> /dev/null; then
    echo "⚠️  Melos not found. Installing globally..."
    dart pub global activate melos
fi

echo "📦 Bootstrapping packages..."
melos bootstrap

echo "🔍 Running analysis..."
melos run analyze

echo "✅ Setup complete!"
echo ""
echo "🎉 Your monorepo is ready!"
echo ""
echo "Next steps:"
echo "  • cd apps/steps_app && flutter run   # Run the app"
echo "  • melos run test                      # Run all tests"
echo "  • melos run format                    # Format code"
echo ""