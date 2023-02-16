import 'package:flutter/material.dart';

class AnswerSelection extends StatelessWidget {
  const AnswerSelection({required this.provideAnswer, Key? key})
      : super(key: key);
  final Function(bool selectedAns) provideAnswer;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 0.0),
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Colors.purple.shade300),
              onPressed: () {
                provideAnswer(true);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF757575),
              ),
              onPressed: () {
                provideAnswer(false);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
