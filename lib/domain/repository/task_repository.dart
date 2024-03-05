import '../entities/task_entity.dart';

abstract class TaskRepository {
  List<Task> getTasks();
  void addTask(Task task);
  void deleteTask(int id);
}