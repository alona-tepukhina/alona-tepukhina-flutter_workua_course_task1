import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
    with TickerProviderStateMixin {
  bool? preferenceRememberUser;
  String navigateTo = '/login';

  Future<void> getUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    preferenceRememberUser = prefs.getBool('rememberUser') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getUserPreferences();

    Timer(const Duration(seconds: 3), () {
      if (preferenceRememberUser == true) {
        navigateTo = '/homepage';
      }
      Navigator.pushNamed(context, navigateTo);
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'images/ginger-cat-759.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
