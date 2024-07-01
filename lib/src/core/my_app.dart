import 'package:flutter/material.dart';
import '../modules/home/home_screen.dart';
import '../themes/dark_theme.dart';

/// [MyApp] This is the main application widget.
/// It sets up the application with a dark theme and initializes the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambord',
      theme: AppThemeDataDark.darkTheme,
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
