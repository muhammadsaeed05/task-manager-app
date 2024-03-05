import 'package:get_it/get_it.dart';
import 'package:task_management_app/data/datasources/task_datasource.dart';
import 'package:task_management_app/data/repositories/task_repository_impl.dart';
import 'package:task_management_app/domain/repository/task_repository.dart';
import 'package:task_management_app/domain/usecases/add_task_usecase.dart';
import 'package:task_management_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_app/domain/usecases/get_task_usecase.dart';
import 'package:task_management_app/presentation/bloc/task/task_bloc.dart';

final getItInstance = GetIt.instance;

Future init() async {
  // Datasources
  getItInstance.registerLazySingleton<TaskDataSource>(() => TaskDataSource());

  // Repository
  getItInstance.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(dataSource: getItInstance()));

  // Usecases
  getItInstance.registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(repository: getItInstance()));

  getItInstance.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(repository: getItInstance()));

  getItInstance.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(repository: getItInstance()));

  // Bloc
  getItInstance.registerFactory<TaskBloc>(() => TaskBloc(
      getTasksUseCase: getItInstance(),
      addTaskUseCase: getItInstance(),
      deleteTaskUseCase: getItInstance()));
}
