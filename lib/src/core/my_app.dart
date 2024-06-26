import 'package:flutter/material.dart';

import '../modules/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambord',
      locale: const Locale('fa'),
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
      ],
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
