import 'package:flutter/material.dart';
import 'package:local_event_app/services/auth_services.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  AuthService authService = AuthService();

  void signup() {
    authService.signUpUser(
      context: context,
      name: "vighnesh",
      email: "hojaaaa@gmail.com",
      password: "testing",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signup();
          },
          child: const Text('SignUP'),
        ),
      ),
    );
  }
}
