import 'package:flutter/material.dart';
import 'my_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Homework1',
      home: MySplashScreen(),
    );
  }
}
