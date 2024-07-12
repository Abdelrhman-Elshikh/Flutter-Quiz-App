import 'package:flutter/material.dart';
import 'package:quiz_app/answers_summary.dart';
import 'back_home_button.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.backHome});

  final List<String> selectedAnswers;
  final void Function() backHome;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final numberOfCorrect = summaryData.where(
      (element) {
        return element['user_answer'] == element['correct_answer'];
      },
    ).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Text(
              "Result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              "you answerd $numberOfCorrect out of $totalQuestions correctly)",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [AnswersSummary(summary: summaryData)],
                ),
              ),
            ),
            const SizedBox(height: 10),
            BackHomeButton(backHome: backHome)
          ],
        ),
      ),
    );
  }
}
