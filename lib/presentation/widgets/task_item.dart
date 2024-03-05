import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/presentation/bloc/task/task_bloc.dart';
import 'package:task_management_app/presentation/theme/theme.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.accentColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Submission Date: ${DateFormat('MM-dd-yyyy').format(task.submissionDate)}',
              style: TextStyle(
                color: AppColors.textColor
                    .withOpacity(0.6), // Subtle opacity for the submission date
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: AppColors.textColor),
          onPressed: () {
            BlocProvider.of<TaskBloc>(context).add(RemoveTaskEvent(task.id));
          },
        ),
      ),
    );
  }
}
