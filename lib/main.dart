import 'package:flutter/material.dart';
import 'src/core/my_app.dart';
import 'src/logic/notification_service.dart';

/// [main] Responsible for initializing and execution of the application
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(const MyApp());
}
