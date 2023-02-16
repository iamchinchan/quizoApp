import 'package:flutter/material.dart';

class ScoreKeeper extends StatelessWidget {
  const ScoreKeeper({required this.scoreSheet, Key? key}) : super(key: key);
  final List<Widget> scoreSheet;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          children: scoreSheet,
        ));
  }
}
