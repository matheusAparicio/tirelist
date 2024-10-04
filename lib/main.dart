import 'package:flutter/material.dart';
import 'package:tirelist/ui/pages/splashscreen/splashcreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TireList',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
