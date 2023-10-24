import 'package:flutter/material.dart';
import 'package:movieflix/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            bodyMedium: TextStyle(fontSize: 18)),
        colorScheme: const ColorScheme.light(
            primary: Colors.transparent, onPrimary: Colors.black),
      ),
      home: HomeScreen(),
    );
  }
}
