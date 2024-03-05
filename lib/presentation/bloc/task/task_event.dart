part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;

  const AddTaskEvent(this.task);
}

class RemoveTaskEvent extends TaskEvent {
  final int taskId;

  const RemoveTaskEvent(this.taskId);
}
