import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final DateTime submissionDate;

  const Task({
    required this.title,
    required this.submissionDate,
    required this.id,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;
}
