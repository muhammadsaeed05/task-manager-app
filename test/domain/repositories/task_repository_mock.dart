import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:task_management_app/domain/repository/task_repository.dart';

@GenerateNiceMocks([MockSpec<TaskRepository>(as: #MockTasksRepository)])
class MockTasksRepository {}
