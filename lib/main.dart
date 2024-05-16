import 'package:flutter/material.dart';
import 'package:students_data/screens/add_std_data.dart';
import 'package:students_data/screens/home_page.dart';
import 'package:students_data/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const HomePage(),
          'add_std': (context) => const AddStdData(),
          '/': (context) => const SplashScreen(),
        },
        );
  }
}
