import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app/main.dart';
import 'package:task_management_app/presentation/task_manager_app.dart';
import 'package:task_management_app/di/get_it.dart' as getIt;

void main() {
  getIt.init();

  testWidgets('TaskManagerApp displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that TaskManagerApp is rendered
    expect(find.byType(TaskManagerApp), findsOneWidget);

    // You can add more specific tests to verify UI components within TaskManagerApp
    // For example:
    expect(find.text('Task List'), findsOneWidget);
    // expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
