import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/quiz_model.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int score = Provider.of<QuizModel>(context, listen: false).score;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [Text("Vous avez marqué $score point(s).")]),
      ),
    );
  }
}