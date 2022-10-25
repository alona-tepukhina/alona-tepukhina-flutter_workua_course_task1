import 'package:flutter/material.dart';
import 'package:flutter_course_hometask1/homepage.dart';
import 'credentials.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final credentials = Credentials();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberUser = false;

  void setUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberUser', true);
    //print(prefs.getBool('rememberUser'));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                //const TextField(
                TextFormField(
                  controller: _usernameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    //labelText: 'Login',
                    hintText: 'Login',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    } else if (value != credentials.username) {
                      return 'Username not found';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                //const TextField(
                TextFormField(
                  //autofocus: true,
                  controller: _passwordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                    //labelText: 'Password',

                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (value != credentials.password) {
                      return 'Password is incorrect';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: rememberUser,
                        onChanged: (value) {
                          setState(() {
                            rememberUser = value!;
                          });
                        }),
                    const Text('Remember me'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        (_usernameController.text == credentials.username) &&
                        (_passwordController.text == credentials.password)) {
                      if (rememberUser) {
                        setUserPreferences();
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Successful')));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
