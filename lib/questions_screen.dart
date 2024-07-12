import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/back_home_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.storeAnswer,
    required this.showResult,
    required this.backHome,
  });

  final void Function() showResult;
  final void Function() backHome;
  final void Function(String) storeAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late int qNumber;
  late QuizQuestion currentQuestion;

  @override
  void initState() {
    qNumber = 0;
    currentQuestion = (questions[qNumber]);
    super.initState();
  }

  void nextQustion(String answer) {
    setState(() {
      qNumber++;
      widget.storeAnswer(answer);
      if (qNumber < questions.length) {
        currentQuestion = questions[qNumber];
      } else {
        widget.showResult();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...currentQuestion.getShuffledList().map(
                    (answer) {
                      return AnswerButton(
                          answerText: answer,
                          onTap: () {
                            nextQustion(answer);
                          });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BackHomeButton(backHome: widget.backHome)
            ],
        ),
      ),
    );
  }
}
