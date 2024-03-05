import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app/presentation/screens/add_task_screen.dart';
import 'package:task_management_app/di/get_it.dart' as getIt;

void main() {
  getIt.init();

  group('AddTaskScreen UI Test', () {
    testWidgets('AddTaskScreen displays input fields and buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AddTaskScreen(),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Add Task'), findsAny);
    });
  });
}
