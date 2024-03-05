import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app/domain/usecases/delete_task_usecase.dart';

import 'package:mockito/mockito.dart';

import '../repositories/task_repository_mock.mocks.dart';

void main() {
  group('DeleteTaskUseCase', () {
    late MockTaskRepository mockTaskRepository;
    late DeleteTaskUseCase deleteTaskUseCase;

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      deleteTaskUseCase = DeleteTaskUseCase(repository: mockTaskRepository);
    });

    test('DeleteTaskUseCase deletes a task', () {
      // Arrange
      final taskId = 1;

      // Act
      deleteTaskUseCase.call(taskId);

      // Assert
      verify(mockTaskRepository.deleteTask(taskId)).called(1);
    });
  });
}
