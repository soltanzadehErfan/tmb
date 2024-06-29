import 'package:flutter/material.dart';
import 'src/core/my_app.dart';
import 'src/logic/notification_service.dart';

/// [main] The main function is responsible for initializing and executing the application.
/// It ensures Flutter bindings are initialized, initializes the notification service,
/// and then runs the main application widget [MyApp].
Future<void> main() async {
  // Ensures Flutter framework is properly initialized before executing any other code.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the notification service to set up local notifications.
  await NotificationService().init();

  // Runs the main application widget [MyApp].
  runApp(const MyApp());
}
