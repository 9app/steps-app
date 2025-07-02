import 'package:intl/intl.dart';

/// Utility functions for date operations
class DateUtils {
  /// Format a date to a readable string
  static String formatDate(DateTime date, {String? format}) {
    format ??= 'yyyy-MM-dd';
    return DateFormat(format).format(date);
  }
  
  /// Format a date and time to a readable string
  static String formatDateTime(DateTime dateTime, {String? format}) {
    format ??= 'yyyy-MM-dd HH:mm';
    return DateFormat(format).format(dateTime);
  }
  
  /// Format time to a readable string
  static String formatTime(DateTime time, {String? format}) {
    format ??= 'HH:mm';
    return DateFormat(format).format(time);
  }
  
  /// Get a relative time string (e.g., "2 days ago", "in 3 hours")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
  
  /// Check if a date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }
  
  /// Check if a date is tomorrow
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year && 
           date.month == tomorrow.month && 
           date.day == tomorrow.day;
  }
  
  /// Check if a date is this week
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    
    return date.isAfter(startOfWeek) && date.isBefore(endOfWeek);
  }
  
  /// Get the start of the day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  
  /// Get the end of the day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }
  
  /// Calculate the number of days between two dates
  static int daysBetween(DateTime start, DateTime end) {
    final startDate = startOfDay(start);
    final endDate = startOfDay(end);
    return endDate.difference(startDate).inDays;
  }
}