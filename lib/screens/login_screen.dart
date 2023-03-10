import 'package:flutter/material.dart';
import 'package:zoom_clone/services/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthMethods _authMethods = AuthMethods(context: context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: Image.asset('assets/onboarding.jpg'),
          ),
          CustomButton(
            text: 'Google Sign-In',
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle();
              if (res) {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
