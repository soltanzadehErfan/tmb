import 'package:flutter/material.dart';
import 'src/core/my_app.dart';
import 'src/logic/notification_service.dart';

// Future<void> main() async => runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => UrlProvider()),
//         ],
//         child: const MyApp(),
//       ),
//     );

// Future<void> main() async => runApp(

//       const MyApp(),
//     );

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(const MyApp());
}
