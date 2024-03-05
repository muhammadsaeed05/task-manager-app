import '../../domain/entities/task_entity.dart';
import '../datasources/task_datasource.dart';
import '../../domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource dataSource;

  TaskRepositoryImpl({required this.dataSource});

  @override
  List<Task> getTasks() {
    return dataSource.getTasks();
  }

  @override
  void addTask(Task task) {
    dataSource.addTask(task);
  }

  @override
  void deleteTask(int id) {
    dataSource.deleteTask(id);
  }
}