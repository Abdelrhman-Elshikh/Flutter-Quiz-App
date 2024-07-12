import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Widget? homePage;
  Widget? quizPage;
  Widget? resultPage;
  Widget? currantPage;

  // List<String>? answers;
  final List<String> answers = [];

  @override
  void initState() {
    homePage = HomePage(startQuiz);
    quizPage = QuestionsScreen(
        backHome: backHome, showResult: showResults, storeAnswer: storeAnswers);
    currantPage = homePage;
    super.initState();
  }

  void storeAnswers(String answer) {
    answers.add(answer);
  }

  void startQuiz() {
    setState(() {
      currantPage = quizPage;
    });
  }

  void backHome() {
    setState(() {
      answers.clear();
      currantPage = homePage;
    });
  }

  void showResults() {
    setState(() {
      resultPage = ResultScreen(
        selectedAnswers: answers,
        backHome: backHome,
      );
      currantPage = resultPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          title: const Text(
            "Quiz App",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 167, 232, 255),
                Color.fromARGB(255, 152, 215, 255),
                Color.fromARGB(255, 105, 160, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: currantPage,
        ),
      ),
    );
  }
}
