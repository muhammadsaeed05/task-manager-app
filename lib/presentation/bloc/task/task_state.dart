part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

class LoadingState extends TaskState {}

class TasksLoadedState extends TaskState {
  final List<Task> tasks;

  const TasksLoadedState(this.tasks);
}

class TaskErrorState extends TaskState {
  final String message;

  const TaskErrorState(this.message);
}
