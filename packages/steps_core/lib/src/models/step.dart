import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step.g.dart';

/// Represents a single step within a task
@JsonSerializable()
class Step extends Equatable {
  const Step({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.order = 0,
    this.estimatedDuration,
    this.actualDuration,
    this.createdAt,
    this.completedAt,
  });

  /// Unique identifier for the step
  final String id;

  /// Title of the step
  final String title;

  /// Optional description providing more details
  final String? description;

  /// Whether this step has been completed
  final bool isCompleted;

  /// Order of this step within the task (0-based)
  final int order;

  /// Estimated time to complete this step (in minutes)
  final int? estimatedDuration;

  /// Actual time taken to complete this step (in minutes)
  final int? actualDuration;

  /// When this step was created
  final DateTime? createdAt;

  /// When this step was completed
  final DateTime? completedAt;

  /// Create a copy of this step with some fields changed
  Step copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    int? order,
    int? estimatedDuration,
    int? actualDuration,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Step(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      order: order ?? this.order,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      actualDuration: actualDuration ?? this.actualDuration,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  /// Create Step from JSON
  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  /// Convert Step to JSON
  Map<String, dynamic> toJson() => _$StepToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
        order,
        estimatedDuration,
        actualDuration,
        createdAt,
        completedAt,
      ];
}