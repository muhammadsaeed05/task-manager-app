import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/presentation/bloc/task/task_bloc.dart';

import '../../../domain/usecases/mocks/mocks.mocks.dart';

void main() {
  group('TaskBloc', () {
    late MockAddTaskUseCase mockAddTaskUseCase;
    late MockDeleteTaskUseCase mockDeleteTaskUseCase;
    late MockGetTasksUseCase mockGetTasksUseCase;

    setUp(() {
      mockAddTaskUseCase = MockAddTaskUseCase();
      mockDeleteTaskUseCase = MockDeleteTaskUseCase();
      mockGetTasksUseCase = MockGetTasksUseCase();
    });

    blocTest<TaskBloc, TaskState>(
      'Emits [LoadingState, TasksLoadedState] when LoadTasksEvent event is added',
      build: () {
        when(mockGetTasksUseCase.call()).thenReturn([]);
        return TaskBloc(
          addTaskUseCase: mockAddTaskUseCase,
          deleteTaskUseCase: mockDeleteTaskUseCase,
          getTasksUseCase: mockGetTasksUseCase,
        );
      },
      act: (bloc) => bloc.add(LoadTasksEvent()),
      expect: () => [
        isA<LoadingState>(),
        TasksLoadedState([]),
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'Emits [LoadingState, TasksLoadedState] when AddTaskEvent event is added',
      build: () {
        when(mockAddTaskUseCase.call(any)).thenReturn(null);
        return TaskBloc(
          addTaskUseCase: mockAddTaskUseCase,
          deleteTaskUseCase: mockDeleteTaskUseCase,
          getTasksUseCase: mockGetTasksUseCase,
        );
      },
      act: (bloc) => bloc.add(AddTaskEvent(
          Task(id: 1, title: 'Task 1', submissionDate: DateTime.now()))),
      expect: () => [
        isA<LoadingState>(),
        TasksLoadedState([]),
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'Emits [LoadingState, TasksLoadedState] when RemoveTaskEvent event is added',
      build: () {
        when(mockDeleteTaskUseCase.call(any)).thenReturn(null);
        return TaskBloc(
          addTaskUseCase: mockAddTaskUseCase,
          deleteTaskUseCase: mockDeleteTaskUseCase,
          getTasksUseCase: mockGetTasksUseCase,
        );
      },
      act: (bloc) => bloc.add(RemoveTaskEvent(1)),
      expect: () => [
        isA<LoadingState>(),
        TasksLoadedState([]),
      ],
    );
  });
}
