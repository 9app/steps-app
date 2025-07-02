import 'package:flutter_test/flutter_test.dart';
import 'package:steps_core/steps_core.dart';

void main() {
  group('Task Model Tests', () {
    test('should create a task with default values', () {
      const task = Task(
        id: 'test-id',
        title: 'Test Task',
      );

      expect(task.id, 'test-id');
      expect(task.title, 'Test Task');
      expect(task.description, isNull);
      expect(task.steps, isEmpty);
      expect(task.isCompleted, false);
      expect(task.priority, TaskPriority.medium);
    });

    test('should calculate completion percentage correctly', () {
      final task = Task(
        id: 'test-id',
        title: 'Test Task',
        steps: [
          const Step(id: '1', title: 'Step 1', isCompleted: true),
          const Step(id: '2', title: 'Step 2', isCompleted: false),
          const Step(id: '3', title: 'Step 3', isCompleted: true),
          const Step(id: '4', title: 'Step 4', isCompleted: false),
        ],
      );

      expect(task.completionPercentage, 0.5);
      expect(task.completedStepsCount, 2);
      expect(task.allStepsCompleted, false);
    });

    test('should detect when all steps are completed', () {
      final task = Task(
        id: 'test-id',
        title: 'Test Task',
        steps: [
          const Step(id: '1', title: 'Step 1', isCompleted: true),
          const Step(id: '2', title: 'Step 2', isCompleted: true),
        ],
      );

      expect(task.allStepsCompleted, true);
      expect(task.completionPercentage, 1.0);
    });

    test('should handle empty steps list', () {
      const task = Task(
        id: 'test-id',
        title: 'Test Task',
      );

      expect(task.completionPercentage, 0.0);
      expect(task.completedStepsCount, 0);
      expect(task.allStepsCompleted, false);
    });
  });
}