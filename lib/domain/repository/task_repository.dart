import '../entities/task_entity.dart';

/// Abstract class defining the contract for interacting with tasks.
abstract class TaskRepository {
  /// Retrieves a list of tasks.
  List<Task> getTasks();

  /// Adds a new task.
  void addTask(Task task);

  /// Deletes a task by its ID.
  void deleteTask(int id);
}
