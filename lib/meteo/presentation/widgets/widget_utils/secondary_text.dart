import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  final String text;

  const SecondaryText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 36),
    );
  }
}
