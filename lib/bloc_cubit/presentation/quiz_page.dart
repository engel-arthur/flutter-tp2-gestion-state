import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_gestion_state/provider/presentation/question_box.dart';
import 'package:tp2_gestion_state/provider/presentation/results_box.dart';

import '../logic/quiz_model.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TP2 - Quizz')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Consumer<QuizModel>(
                builder: (context, quiz, child) {
                  return _getNextWidget(quiz);
                },
              ),
            )
          ],
        ));
  }

  Widget _getNextWidget(QuizModel quiz) {
    int questionIndex = quiz.questionIndex;
    int questionLength = quiz.questions.length;

    if (questionIndex < questionLength) {
      return const QuestionBox();
    } else {
      return const ResultsBox();
    }
  }
}