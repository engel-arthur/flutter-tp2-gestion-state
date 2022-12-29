import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String text;

  const MainText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
