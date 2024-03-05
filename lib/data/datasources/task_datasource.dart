import 'package:task_management_app/domain/entities/task_entity.dart';

class TaskDataSource {
  // Dummy database
  List<Task> tasks = [];

  // Initialize with dummy data
  TaskDataSource() {
    tasks = [
      const Task(id: 1, title: 'Task 1'),
      const Task(id: 2, title: 'Task 2'),
      const Task(id: 3, title: 'Task 3'),
    ];
  }

  // Get all tasks
  List<Task> getTasks() {
    return tasks;
  }

  // Add a new task
  void addTask(Task task) {
    tasks.add(task);
  }

  // Delete a task by ID
  void deleteTask(int id) {
    tasks.removeWhere((task) => task.id == id);
  }
}
