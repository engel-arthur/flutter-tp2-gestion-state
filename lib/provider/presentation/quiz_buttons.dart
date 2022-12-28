import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/quiz_model.dart';

class QuizButtons extends StatelessWidget {
  const QuizButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function checkAnswer =
        Provider.of<QuizModel>(context, listen: false).checkAnswer;
    Function incrementQuestionIndex =
        Provider.of<QuizModel>(context, listen: false).incrementQuestionIndex;

    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        buildAnswerButton(checkAnswer, true),
        buildAnswerButton(checkAnswer, false),
        getNextQuestionButton(incrementQuestionIndex)
      ],
    );
  }

  ElevatedButton getNextQuestionButton(Function incrementQuestionIndex) {
    return ElevatedButton(
      onPressed: () {
        incrementQuestionIndex();
      },
      child: const Icon(Icons.arrow_right),
    );
  }

  ElevatedButton buildAnswerButton(Function checkAnswer, bool stateButton) {
    String message = stateButton ? "Vrai" : "Faux";

    return ElevatedButton(
      onPressed: () {
        checkAnswer(stateButton);
      },
      child: Text(message),
    );
  }
}