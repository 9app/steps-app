import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

/// Represents a category for organizing tasks
@JsonSerializable()
class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    this.description,
    this.color = 0xFF2196F3, // Default blue color
    this.icon = 'folder',
    this.createdAt,
  });

  /// Unique identifier for the category
  final String id;

  /// Name of the category
  final String name;

  /// Optional description of the category
  final String? description;

  /// Color associated with the category (ARGB format)
  final int color;

  /// Icon name for the category
  final String icon;

  /// When this category was created
  final DateTime? createdAt;

  /// Create a copy of this category with some fields changed
  Category copyWith({
    String? id,
    String? name,
    String? description,
    int? color,
    String? icon,
    DateTime? createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Create Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Convert Category to JSON
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        color,
        icon,
        createdAt,
      ];
}