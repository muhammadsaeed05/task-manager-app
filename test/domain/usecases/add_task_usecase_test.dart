import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/domain/usecases/add_task_usecase.dart';

import 'get_task_usecase_test.mocks.dart';

void main() {
  group('AddTaskUseCase', () {
    late MockTaskRepository mockTaskRepository;
    late AddTaskUseCase addTaskUseCase;

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      addTaskUseCase = AddTaskUseCase(repository: mockTaskRepository);
    });

    test('AddTaskUseCase adds a task', () {
      // Arrange
      final task = Task(id: 1, title: 'Task 1', submissionDate: DateTime.now());

      // Act
      addTaskUseCase.call(task);

      // Assert
      verify(mockTaskRepository.addTask(task)).called(1);
    });
  });
}
