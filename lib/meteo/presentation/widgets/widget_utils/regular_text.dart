import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  const RegularText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14),
    );
  }
}
