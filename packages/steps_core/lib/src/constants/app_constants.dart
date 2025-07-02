/// App-wide constants
class AppConstants {
  /// App information
  static const String appName = 'Steps Manager';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.nguyenlamzx.steps_app';
  
  /// Database constants
  static const String databaseName = 'steps_app.db';
  static const int databaseVersion = 1;
  
  /// Table names
  static const String tasksTable = 'tasks';
  static const String stepsTable = 'steps';
  static const String categoriesTable = 'categories';
  static const String userPreferencesTable = 'user_preferences';
  
  /// SharedPreferences keys
  static const String userPreferencesKey = 'user_preferences';
  static const String firstLaunchKey = 'first_launch';
  static const String lastBackupKey = 'last_backup';
  
  /// Default values
  static const int defaultEstimatedDuration = 30; // minutes
  static const int maxTaskTitleLength = 100;
  static const int maxStepTitleLength = 80;
  static const int maxDescriptionLength = 500;
  
  /// UI constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 8.0;
  
  /// Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  /// Colors (Material Design)
  static const int primaryColor = 0xFF1976D2;
  static const int accentColor = 0xFF03DAC6;
  static const int errorColor = 0xFFB00020;
  static const int warningColor = 0xFFFF9800;
  static const int successColor = 0xFF4CAF50;
  
  /// Default category colors
  static const List<int> defaultCategoryColors = [
    0xFF2196F3, // Blue
    0xFF4CAF50, // Green
    0xFFFF9800, // Orange
    0xFF9C27B0, // Purple
    0xFFF44336, // Red
    0xFF607D8B, // Blue Grey
    0xFF795548, // Brown
    0xFF009688, // Teal
  ];
  
  /// Default category icons
  static const List<String> defaultCategoryIcons = [
    'work',
    'home',
    'school',
    'fitness',
    'shopping',
    'health',
    'travel',
    'hobby',
  ];
}