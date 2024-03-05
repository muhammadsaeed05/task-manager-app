import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/domain/repository/task_repository.dart';
import 'package:task_management_app/domain/usecases/get_task_usecase.dart';

import 'get_task_usecase_test.mocks.dart';

// class MockTaskRepository extends Mock implements TaskRepositoryImpl {}
@GenerateNiceMocks([MockSpec<TaskRepository>()])
void main() {
  group('GetTasksUseCase', () {
    late MockTaskRepository mockTaskRepository;
    late GetTasksUseCase getTasksUseCase;

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      getTasksUseCase = GetTasksUseCase(repository: mockTaskRepository);
    });

    test('GetTasksUseCase returns a list of tasks', () {
      // Arrange
      final tasks = [
        Task(id: 1, title: 'Task 1', submissionDate: DateTime.now()),
        Task(id: 2, title: 'Task 2', submissionDate: DateTime.now()),
        Task(id: 3, title: 'Task 3', submissionDate: DateTime.now()),
      ];
      when(mockTaskRepository.getTasks()).thenReturn(tasks);

      // Act
      final result = getTasksUseCase();

      // Assert
      expect(result, tasks);
    });
  });
}
