# Steps App

A personal step-by-step task organizer application built with Flutter.

## Features

- Create and manage multi-step tasks
- Local data storage for privacy
- Intuitive step-by-step interface
- Task organization and categorization

## Getting Started

This app is part of the Steps App monorepo. To run this app:

1. Make sure you have Flutter installed and configured
2. Run `melos bootstrap` from the root directory to install dependencies
3. Navigate to this directory: `cd apps/steps_app`
4. Run the app: `flutter run`

## Privacy

This app prioritizes your privacy by storing all data locally on your device. No data is transmitted to external servers. See the privacy policy in the `/docs/privacy/` directory for more details.

## Architecture

This app follows clean architecture principles and uses:

- **BLoC** for state management
- **SQLite** for local data persistence  
- **Shared packages** from the monorepo for common functionality

## Development

- Follow the monorepo development guidelines
- Use `melos` commands for common tasks across all packages
- Run tests with `flutter test`
- Format code with `dart format .`