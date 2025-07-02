# Steps Core

Core shared functionality and models for the Steps App ecosystem.

## Features

- Data models for tasks, steps, and user data
- Shared utilities and constants
- Common interfaces and abstract classes
- Serialization helpers

## Usage

This package is used by other packages in the Steps App monorepo:

```dart
import 'package:steps_core/steps_core.dart';

// Use shared models and utilities
final task = Task(
  id: const Uuid().v4(),
  title: 'My Task',
  steps: [],
);
```

## Models

- `Task`: Represents a multi-step task
- `Step`: Individual step within a task
- `Category`: Task categorization
- `UserPreferences`: User settings and preferences

## Development

This package follows the repository's development guidelines and can be developed alongside other packages using `melos` commands.