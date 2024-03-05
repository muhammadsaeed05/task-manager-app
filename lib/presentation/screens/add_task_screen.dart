import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/di/get_it.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/presentation/bloc/task/task_bloc.dart';
import 'package:task_management_app/presentation/theme/theme.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
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

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
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
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text(
                    'Submission Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      '${_selectedDate.month}-${_selectedDate.day}-${_selectedDate.year}',
                      style: const TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final taskTitle = _titleController.text.trim();
                  if (taskTitle.isNotEmpty) {
                    final task = Task(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: taskTitle,
                      submissionDate: _selectedDate,
                    );
                    _bloc.add(AddTaskEvent(task));
                    Navigator.of(context).pop();
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
