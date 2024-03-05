import '../entities/task_entity.dart';
import '../repository/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase({required this.repository});

  void call(Task task) {
    repository.addTask(task);
  }
}