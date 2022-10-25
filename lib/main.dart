import 'package:flutter/material.dart';
import 'package:flutter_course_hometask1/homepage.dart';
import 'my_splash_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework1',
      //home: MySplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MySplashScreen(),
        '/homepage': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
