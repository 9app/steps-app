# Development Guide

This document provides guidance for developing within the Steps App monorepo.

## Prerequisites

- **Flutter SDK** (≥3.10.0) - [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (≥3.0.0) - Included with Flutter
- **mise** - Development environment management - [Installation](https://mise.jdx.dev/)
- **melos** - Monorepo management - `dart pub global activate melos`

## Quick Start

1. **Setup the environment**:
   ```bash
   ./tools/scripts/setup.sh
   ```

2. **Run the app**:
   ```bash
   cd apps/steps_app
   flutter run
   ```

## Monorepo Structure

```
├── apps/                   # Applications
│   └── steps_app/         # Main Flutter app
├── packages/              # Shared packages
│   └── steps_core/        # Core shared functionality
├── docs/                  # Documentation
│   └── privacy/          # Privacy policies
├── tools/                 # Development tools
│   └── scripts/          # Build and setup scripts
├── .mise.toml            # Environment configuration
├── melos.yaml            # Monorepo configuration
└── README.md             # Main documentation
```

## Common Commands

### Monorepo Management
```bash
# Install dependencies across all packages
melos bootstrap

# Clean all packages
melos clean

# Run analysis on all packages
melos run analyze

# Format all packages
melos run format

# Run tests for all packages
melos run test

# Get dependencies for all packages
melos run get
```

### Individual Package Development
```bash
# Work on a specific package
cd packages/steps_core
flutter pub get
dart analyze
flutter test

# Work on the main app
cd apps/steps_app
flutter pub get
flutter run
flutter test
```

## Development Workflow

1. **Feature Development**:
   - Create a feature branch
   - Make changes in appropriate packages
   - Test changes locally
   - Run quality checks

2. **Quality Checks**:
   ```bash
   melos run analyze    # Code analysis
   melos run format     # Code formatting
   melos run test       # Run tests
   ```

3. **Testing**:
   - Unit tests in `test/` directories
   - Widget tests for Flutter components
   - Integration tests for complete workflows

## Package Dependencies

### apps/steps_app
- Depends on `steps_core` for shared functionality
- Contains UI, business logic, and app-specific code
- Uses BLoC for state management

### packages/steps_core
- Contains shared models, utilities, and constants
- No UI dependencies
- Pure Dart package with minimal dependencies

## Code Style Guidelines

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `dart format` for consistent formatting
- Write meaningful tests for new functionality
- Document public APIs

## Adding New Packages

1. Create package directory under `packages/`
2. Initialize with `flutter create --template=package package_name`
3. Update `melos.yaml` if needed (wildcard patterns should handle most cases)
4. Run `melos bootstrap` to link dependencies

## Building for Release

Use the build script:
```bash
./tools/scripts/build.sh
```

Or manually:
```bash
cd apps/steps_app
flutter build apk --release    # Android
flutter build ios --release    # iOS (macOS only)
```

## Troubleshooting

### Common Issues

1. **Dependencies not found**:
   ```bash
   melos clean
   melos bootstrap
   ```

2. **Build failures**:
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Analysis errors**:
   ```bash
   dart fix --apply    # Auto-fix some issues
   ```

### Environment Issues

- Ensure mise is properly configured: `mise doctor`
- Check Flutter installation: `flutter doctor`
- Verify Dart version: `dart --version`

## Contributing

1. Follow the existing code structure
2. Add tests for new functionality  
3. Update documentation as needed
4. Run quality checks before submitting
5. Use descriptive commit messages

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Melos Documentation](https://melos.invertase.dev/)
- [mise Documentation](https://mise.jdx.dev/)