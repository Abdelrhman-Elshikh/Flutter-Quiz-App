import 'package:flutter/material.dart';
import 'package:quiz_app/summary_question_number.dart';

class AnswersSummary extends StatelessWidget {
  const AnswersSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ...summary.map(
            (resultSummary) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryQuestionNumber(
                    correctAnswer: resultSummary['correct_answer'] as String,
                    choosenAnswer: resultSummary['user_answer'] as String,
                    index: resultSummary['question_index'] as int,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resultSummary['question'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          resultSummary['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 9, 152, 14),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          resultSummary['user_answer'] as String,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
