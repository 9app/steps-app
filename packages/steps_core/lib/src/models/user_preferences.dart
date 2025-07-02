import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_preferences.g.dart';

/// User preferences and settings
@JsonSerializable()
class UserPreferences extends Equatable {
  const UserPreferences({
    this.themeMode = ThemeMode.system,
    this.defaultTaskPriority = 'medium',
    this.enableNotifications = true,
    this.notificationTime = const TimeOfDay(hour: 9, minute: 0),
    this.autoCompleteTaskWhenAllStepsComplete = true,
    this.showCompletedTasks = false,
    this.defaultView = TaskView.list,
    this.language = 'en',
    this.dateFormat = 'yyyy-MM-dd',
    this.timeFormat = 'HH:mm',
  });

  /// Theme mode preference
  final ThemeMode themeMode;

  /// Default priority for new tasks
  final String defaultTaskPriority;

  /// Whether to enable notifications
  final bool enableNotifications;

  /// Default time for daily notifications
  final TimeOfDay notificationTime;

  /// Auto-complete task when all steps are completed
  final bool autoCompleteTaskWhenAllStepsComplete;

  /// Show completed tasks in the main view
  final bool showCompletedTasks;

  /// Default view for tasks
  final TaskView defaultView;

  /// Preferred language
  final String language;

  /// Date format preference
  final String dateFormat;

  /// Time format preference
  final String timeFormat;

  /// Create a copy of preferences with some fields changed
  UserPreferences copyWith({
    ThemeMode? themeMode,
    String? defaultTaskPriority,
    bool? enableNotifications,
    TimeOfDay? notificationTime,
    bool? autoCompleteTaskWhenAllStepsComplete,
    bool? showCompletedTasks,
    TaskView? defaultView,
    String? language,
    String? dateFormat,
    String? timeFormat,
  }) {
    return UserPreferences(
      themeMode: themeMode ?? this.themeMode,
      defaultTaskPriority: defaultTaskPriority ?? this.defaultTaskPriority,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      notificationTime: notificationTime ?? this.notificationTime,
      autoCompleteTaskWhenAllStepsComplete: autoCompleteTaskWhenAllStepsComplete ?? this.autoCompleteTaskWhenAllStepsComplete,
      showCompletedTasks: showCompletedTasks ?? this.showCompletedTasks,
      defaultView: defaultView ?? this.defaultView,
      language: language ?? this.language,
      dateFormat: dateFormat ?? this.dateFormat,
      timeFormat: timeFormat ?? this.timeFormat,
    );
  }

  /// Create UserPreferences from JSON
  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

  /// Convert UserPreferences to JSON
  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);

  @override
  List<Object?> get props => [
        themeMode,
        defaultTaskPriority,
        enableNotifications,
        notificationTime,
        autoCompleteTaskWhenAllStepsComplete,
        showCompletedTasks,
        defaultView,
        language,
        dateFormat,
        timeFormat,
      ];
}

/// Theme mode options
enum ThemeMode {
  system,
  light,
  dark;

  String get displayName {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }
}

/// Task view options
enum TaskView {
  list,
  grid,
  kanban;

  String get displayName {
    switch (this) {
      case TaskView.list:
        return 'List';
      case TaskView.grid:
        return 'Grid';
      case TaskView.kanban:
        return 'Kanban';
    }
  }
}

/// Time of day representation
@JsonSerializable()
class TimeOfDay extends Equatable {
  const TimeOfDay({
    required this.hour,
    required this.minute,
  });

  final int hour;
  final int minute;

  /// Create TimeOfDay from JSON
  factory TimeOfDay.fromJson(Map<String, dynamic> json) => _$TimeOfDayFromJson(json);

  /// Convert TimeOfDay to JSON
  Map<String, dynamic> toJson() => _$TimeOfDayToJson(this);

  @override
  List<Object?> get props => [hour, minute];

  @override
  String toString() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}