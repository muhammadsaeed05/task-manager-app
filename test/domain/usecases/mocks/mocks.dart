import 'package:mockito/annotations.dart';
import 'package:task_management_app/domain/usecases/add_task_usecase.dart';
import 'package:task_management_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_app/domain/usecases/get_task_usecase.dart';

@GenerateNiceMocks([
  MockSpec<GetTasksUseCase>(),
  MockSpec<AddTaskUseCase>(),
  MockSpec<DeleteTaskUseCase>()
])
void main() {}
