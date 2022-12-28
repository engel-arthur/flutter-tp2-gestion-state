import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_gestion_state/provider/presentation/padded_text.dart';
import 'package:tp2_gestion_state/provider/presentation/quiz_buttons.dart';

import '../logic/question.dart';
import '../logic//quiz_model.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(child: Consumer<QuizModel>(builder: (context, quiz, child) {
          return Column(children: _generateQuizElements(quiz));
        })),
      ],
    );
  }

  List<Widget> _generateQuizElements(QuizModel quiz) {
    int questionIndex = quiz.questionIndex;
    bool answered = quiz.answered;
    Question question = quiz.questions[questionIndex];

    List<Widget> widgets = [
      PaddedText(text: question.questionText),
      Image.asset(question.urlImage, width: 300),
      const QuizButtons()
    ];
    if (answered) {
      widgets.add(PaddedText(text: question.answerText));
    }
    return widgets;
  }
}