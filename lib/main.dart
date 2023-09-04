import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator APP',
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor: const Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF0A0E21), centerTitle: true)),
      home: const homePage(title: 'BMI Calculator APP'),
    );
  }
}