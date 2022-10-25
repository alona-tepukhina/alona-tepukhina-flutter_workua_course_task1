import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'Hello :)',
          style: TextStyle(
              fontSize: 46, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      )),
    );
  }
}
