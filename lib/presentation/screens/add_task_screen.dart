import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/di/get_it.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/presentation/bloc/task/task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  late TaskBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getItInstance();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: BlocProvider.value(
        value: _bloc,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final taskTitle = _textEditingController.text.trim();
                  if (taskTitle.isNotEmpty) {
                    _bloc.add(AddTaskEvent(Task(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: taskTitle)));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
