import 'package:flutter/material.dart';
import 'package:local_event_app/provider/user_provider.dart';
import 'package:local_event_app/routes.dart';
import 'package:local_event_app/ui/auth_screen/login_screen.dart';
// import 'package:local_event_app/demo.dart';
import 'package:local_event_app/ui/homepage/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xFFFF4700),
      ),

      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomePage()
          : const LoginScreen(),

      // home: const HomePage(),
      // home: const DemoScreen(),
    );
  }
}
