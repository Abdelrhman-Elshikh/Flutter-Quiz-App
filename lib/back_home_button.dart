import 'package:flutter/material.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key, required this.backHome});

  final void Function() backHome;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: backHome,
      label: const Text(
        "Home",
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      icon: const Icon(Icons.arrow_left),
    );
  }
}
