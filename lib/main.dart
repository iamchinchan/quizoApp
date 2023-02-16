import 'package:flutter/material.dart';
import 'question_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Quizo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B1FA2),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFE1BEE7),
          ),
        ),
      ),
      body: Container(
        // color: const Color(0xFF9e9e9e),
        color: const Color(0xFFbdbdbd),
        child: const SafeArea(
          child: QuestionScreen(),
        ),
      ),
    );
  }
}
