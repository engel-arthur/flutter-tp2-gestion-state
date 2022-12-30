import 'package:flutter/material.dart';

class PaddedCenteredText extends StatelessWidget {
  final String text;

  const PaddedCenteredText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
