import 'package:flutter/material.dart';

class QuestionBar extends StatelessWidget {
  const QuestionBar({required this.questionText, Key? key}) : super(key: key);
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 7,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Center(
            child: Text(
              questionText,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ));
  }
}
