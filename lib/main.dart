import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/core/my_app.dart';
import 'src/logic/url_provider.dart';

// Future<void> main() async => runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => UrlProvider()),
//         ],
//         child: const MyApp(),
//       ),
//     );

Future<void> main() async => runApp(
      const MyApp(),
    );
