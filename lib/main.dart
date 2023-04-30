import 'package:flutter/material.dart';
import 'package:wear_jisho/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear Jisho',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
          surface: Colors.black,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
