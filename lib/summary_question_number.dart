import 'package:flutter/material.dart';

class SummaryQuestionNumber extends StatelessWidget {
  const SummaryQuestionNumber(
      {super.key,
      required this.correctAnswer,
      required this.choosenAnswer,
      required this.index});

  final String correctAnswer;
  final String choosenAnswer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: correctAnswer == choosenAnswer
          ? Colors.greenAccent
          : Colors.redAccent,
      child: Text(
        (index + 1).toString(),
      ),
    );
  }
}
