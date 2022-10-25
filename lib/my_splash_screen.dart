import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_course_hometask1/homepage.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  bool? preferenceRememberUser;
  String navigateTo = '/login';

  Future<void> getUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    //await prefs.remove('rememberUser');
    preferenceRememberUser = prefs.getBool('rememberUser') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getUserPreferences();
    print(preferenceRememberUser);
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           (preferenceRememberUser) ? HomePage() : LoginScreen(),
    //     ),
    //   ),
    // );

    if (preferenceRememberUser == true) {
      navigateTo = '/homepage';
    }

    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, navigateTo));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'images/ginger-cat-759.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
