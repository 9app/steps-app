import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'step.dart';

part 'task.g.dart';

/// Represents a multi-step task
@JsonSerializable()
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    this.description,
    this.steps = const [],
    this.categoryId,
    this.isCompleted = false,
    this.priority = TaskPriority.medium,
    this.dueDate,
    this.createdAt,
    this.completedAt,
    this.tags = const [],
  });

  /// Unique identifier for the task
  final String id;

  /// Title of the task
  final String title;

  /// Optional description providing more details
  final String? description;

  /// List of steps that make up this task
  final List<Step> steps;

  /// Category this task belongs to
  final String? categoryId;

  /// Whether this task has been completed
  final bool isCompleted;

  /// Priority level of the task
  final TaskPriority priority;

  /// Optional due date for the task
  final DateTime? dueDate;

  /// When this task was created
  final DateTime? createdAt;

  /// When this task was completed
  final DateTime? completedAt;

  /// Tags associated with this task
  final List<String> tags;

  /// Get the percentage of completed steps
  double get completionPercentage {
    if (steps.isEmpty) return 0.0;
    final completedSteps = steps.where((step) => step.isCompleted).length;
    return completedSteps / steps.length;
  }

  /// Get the number of completed steps
  int get completedStepsCount {
    return steps.where((step) => step.isCompleted).length;
  }

  /// Check if all steps are completed
  bool get allStepsCompleted {
    return steps.isNotEmpty && steps.every((step) => step.isCompleted);
  }

  /// Create a copy of this task with some fields changed
  Task copyWith({
    String? id,
    String? title,
    String? description,
    List<Step>? steps,
    String? categoryId,
    bool? isCompleted,
    TaskPriority? priority,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? completedAt,
    List<String>? tags,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      steps: steps ?? this.steps,
      categoryId: categoryId ?? this.categoryId,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      tags: tags ?? this.tags,
    );
  }

  /// Create Task from JSON
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// Convert Task to JSON
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        steps,
        categoryId,
        isCompleted,
        priority,
        dueDate,
        createdAt,
        completedAt,
        tags,
      ];
}

/// Priority levels for tasks
enum TaskPriority {
  low,
  medium,
  high,
  urgent;

  /// Get display name for the priority
  String get displayName {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
      case TaskPriority.urgent:
        return 'Urgent';
    }
  }
}