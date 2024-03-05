import '../entities/task_entity.dart';
import '../repository/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase({required this.repository});

  List<Task> call() {
    return repository.getTasks();
  }
}