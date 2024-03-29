import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/domain/usecases/add_task_usecase.dart';
import 'package:task_management_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_app/domain/usecases/get_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

/// BLoC (Business Logic Component) responsible for managing tasks.
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase getTasksUseCase;
  final AddTaskUseCase addTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;

  /// Constructor for TaskBloc.
  TaskBloc({
    required this.getTasksUseCase,
    required this.addTaskUseCase,
    required this.deleteTaskUseCase,
  }) : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) {
      _mapLoadTaskEventToState(event, emit);
    });

    on<AddTaskEvent>(((event, emit) {
      _mapAddTaskEventToState(event, emit);
    }));

    on<RemoveTaskEvent>((event, emit) {
      _mapRemoveTaskEventToState(event, emit);
    });
  }

  /// Maps the [RemoveTaskEvent] to the appropriate [TaskState].
  void _mapRemoveTaskEventToState(
      RemoveTaskEvent event, Emitter<TaskState> emit) {
    try {
      deleteTaskUseCase(event.taskId);
      add(LoadTasksEvent());
    } catch (e) {
      emit(const TaskErrorState('Failed to delete task'));
    }
  }

  /// Maps the [AddTaskEvent] to the appropriate [TaskState].
  void _mapAddTaskEventToState(AddTaskEvent event, Emitter<TaskState> emit) {
    try {
      addTaskUseCase(event.task);
      add(LoadTasksEvent());
    } catch (e) {
      emit(const TaskErrorState('Failed to add task'));
    }
  }

  /// Maps the [LoadTasksEvent] to the appropriate [TaskState].
  void _mapLoadTaskEventToState(LoadTasksEvent event, Emitter<TaskState> emit) {
    emit(LoadingState());
    try {
      final tasks = getTasksUseCase();
      emit(TasksLoadedState(tasks));
    } catch (e) {
      emit(const TaskErrorState("Failed to load tasks"));
    }
  }
}
