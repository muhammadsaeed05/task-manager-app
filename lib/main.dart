import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management_app/presentation/task_manager_app.dart';

import 'di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  getIt.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const TaskManagerApp();
  }
}
