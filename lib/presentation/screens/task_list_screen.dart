import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/di/get_it.dart';
import 'package:task_management_app/presentation/bloc/task/task_bloc.dart';
import 'package:task_management_app/presentation/screens/add_task_screen.dart';
import 'package:task_management_app/presentation/theme/theme.dart';
import 'package:task_management_app/presentation/widgets/task_item.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late TaskBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getItInstance();
    _bloc.add(LoadTasksEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Task List'),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: BlocProvider.value(
        value: _bloc,
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TasksLoadedState) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return TaskItem(task: task);
                },
              );
            } else if (state is TaskErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown State'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accentColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          ).then((value) => _bloc.add(LoadTasksEvent()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
