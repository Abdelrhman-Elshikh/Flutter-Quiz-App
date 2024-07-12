import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/image.png",
          width: 300,
          opacity: const AlwaysStoppedAnimation(.5),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Quiz App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
          onPressed: changeScreen,
          label: const Text(
            "start Quiz",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.arrow_right_alt),
        ),
      ],
    ));
  }
}
