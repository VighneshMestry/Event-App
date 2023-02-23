import 'package:flutter/material.dart';
import 'package:local_event_app/ui/homepage/home_page.dart';
import 'package:local_event_app/ui/homepage/home_page_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xFFFF4700),
      ),
      
      home: const HomePage(),
    );
  }
}

