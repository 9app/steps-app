/// Utility functions for validation
class ValidationUtils {
  /// Validate task title
  static String? validateTaskTitle(String? title) {
    if (title == null || title.trim().isEmpty) {
      return 'Title is required';
    }
    
    if (title.trim().length > 100) {
      return 'Title must be less than 100 characters';
    }
    
    return null;
  }
  
  /// Validate step title
  static String? validateStepTitle(String? title) {
    if (title == null || title.trim().isEmpty) {
      return 'Step title is required';
    }
    
    if (title.trim().length > 80) {
      return 'Step title must be less than 80 characters';
    }
    
    return null;
  }
  
  /// Validate description
  static String? validateDescription(String? description) {
    if (description != null && description.trim().length > 500) {
      return 'Description must be less than 500 characters';
    }
    
    return null;
  }
  
  /// Validate category name
  static String? validateCategoryName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Category name is required';
    }
    
    if (name.trim().length > 50) {
      return 'Category name must be less than 50 characters';
    }
    
    return null;
  }
  
  /// Validate estimated duration
  static String? validateEstimatedDuration(String? duration) {
    if (duration == null || duration.trim().isEmpty) {
      return null; // Optional field
    }
    
    final durationInt = int.tryParse(duration);
    if (durationInt == null) {
      return 'Duration must be a valid number';
    }
    
    if (durationInt <= 0) {
      return 'Duration must be greater than 0';
    }
    
    if (durationInt > 1440) { // 24 hours in minutes
      return 'Duration cannot exceed 24 hours';
    }
    
    return null;
  }
  
  /// Validate email format
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return null; // Optional field
    }
    
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }
  
  /// Check if a string is not empty or null
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
  
  /// Check if a string is empty or null
  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
  
  /// Sanitize input text
  static String sanitizeInput(String input) {
    return input.trim().replaceAll(RegExp(r'\s+'), ' ');
  }
  
  /// Check if a date is valid (not in the past for due dates)
  static String? validateDueDate(DateTime? dueDate) {
    if (dueDate == null) {
      return null; // Optional field
    }
    
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dueDateOnly = DateTime(dueDate.year, dueDate.month, dueDate.day);
    
    if (dueDateOnly.isBefore(today)) {
      return 'Due date cannot be in the past';
    }
    
    return null;
  }
}