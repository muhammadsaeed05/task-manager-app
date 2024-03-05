import 'package:flutter/material.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/presentation/theme/theme.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

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
      body: Padding(
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
                  Navigator.of(context).pop(task);
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
