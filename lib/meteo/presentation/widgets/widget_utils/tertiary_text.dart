import 'package:flutter/material.dart';

class TertiaryText extends StatelessWidget {
  final String text;

  const TertiaryText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(fontSize: 16),
    );
  }
}
