# Steps App Monorepo

A personal step-by-step task organizer application built with Flutter, organized as a monorepo.

## 🏗️ Architecture

This repository is structured as a monorepo containing:

- **apps/**: Flutter applications
  - `steps_app/`: Main Steps Manager mobile application
- **packages/**: Shared packages and libraries
  - `steps_core/`: Core models, utilities, and constants
- **docs/**: Documentation and resources
  - `privacy/`: Privacy policy and legal documents
- **tools/**: Development tools and scripts

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (≥3.10.0)
- [Dart](https://dart.dev/get-dart) (≥3.0.0)
- [mise](https://mise.jdx.dev/) - Development environment management
- [melos](https://melos.invertase.dev/) - Monorepo management tool

### Setup

1. **Install mise** (if not already installed):
   ```bash
   curl https://mise.jdx.dev/install.sh | sh
   ```

2. **Install development tools**:
   ```bash
   mise install
   ```

3. **Install melos globally**:
   ```bash
   dart pub global activate melos
   ```

4. **Bootstrap the monorepo**:
   ```bash
   melos bootstrap
   ```

### Development Commands

The monorepo uses `melos` for managing dependencies and running scripts across all packages:

```bash
# Install dependencies for all packages
melos bootstrap

# Run analysis on all packages
melos run analyze

# Format code in all packages
melos run format

# Run tests for all packages
melos run test

# Clean and reinstall dependencies
melos run clean:get

# Get dependencies for all packages
melos run get
```

### Running the App

To run the main Steps Manager app:

```bash
cd apps/steps_app
flutter run
```

## 📱 Features

- **Privacy-Focused**: All data stored locally on device
- **Multi-Step Tasks**: Break down complex tasks into manageable steps
- **Task Organization**: Categorize and prioritize your tasks
- **Progress Tracking**: Visual progress indicators for task completion
- **Offline-First**: Works completely offline, no internet required

## 🔧 Development

### Project Structure

```
├── apps/
│   └── steps_app/          # Main Flutter application
├── packages/
│   └── steps_core/         # Shared core functionality
├── docs/
│   └── privacy/            # Privacy policy documents
├── tools/                  # Development tools
├── .mise.toml             # Development environment config
└── melos.yaml             # Monorepo configuration
```

### Adding New Packages

1. Create a new directory under `packages/`
2. Add the package to `melos.yaml` if not using wildcard patterns
3. Run `melos bootstrap` to link dependencies

### Code Style

- Use `dart format` for consistent formatting
- Follow Flutter/Dart style guidelines
- Use meaningful commit messages

## 🔒 Privacy

This application prioritizes user privacy:

- **Local Storage Only**: All data remains on your device
- **No Data Collection**: We don't collect any personal information
- **No External Services**: No analytics, ads, or third-party integrations
- **Open Source**: Full transparency in how your data is handled

See [Privacy Policy](docs/privacy/) for complete details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure code quality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Contact

- Email: nguyenlamzx@gmail.com
- Repository: https://github.com/9app/steps-app-privacy

---

**Steps Manager** - Your Personal Step-by-Step Task Organizer