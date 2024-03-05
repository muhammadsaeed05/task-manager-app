import '../repository/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase({required this.repository});

  void call(int id) {
    repository.deleteTask(id);
  }
}