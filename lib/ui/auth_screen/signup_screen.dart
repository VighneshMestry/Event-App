import 'package:flutter/material.dart';
import 'package:local_event_app/constants/custom_textfield.dart';
import 'package:local_event_app/constants/global_variables.dart';
import 'package:local_event_app/services/auth_services.dart';
import 'package:local_event_app/ui/auth_screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  AuthService authService = AuthService();

  void signUpUserFunction() {
    authService.signUpUser(
      context: context,
      name: nameTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 7,
                  left: 16,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Hello \nThere',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 70,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextField(
                        controller: nameTextController,
                        hintText: 'Enter your name'),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: emailTextController,
                        hintText: 'Enter your email'),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: passwordTextController,
                        hintText: 'Enter password'),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: GlobalVariables.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 16),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            GlobalVariables.primaryColor),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, 50),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        signUpUserFunction();
                      },
                      child: const Text('SignUp'),
                      // ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(double.infinity, 50),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(width: 3, color: Colors.black),
                          ),
                        ),
                      ),
                      // style: TextButton.styleFrom(
                      //   side: BorderSide(width: 3.0),
                      //   shape:
                      // ),
                      onPressed: () {},
                      child: const Text(
                        'SignUp with Google',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      // ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                        print('done');
                      },
                      child: const Text(
                        "Already Have an account? Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
