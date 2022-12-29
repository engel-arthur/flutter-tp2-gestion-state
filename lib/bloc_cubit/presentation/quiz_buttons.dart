import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_gestion_state/bloc_cubit/business_logic/cubit/answer_cubit.dart';

class QuizButtons extends StatelessWidget {
  const QuizButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerCubit, AnswerState>(
      builder: (context, state) {
        return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            buildAnswerButton(BlocProvider.of<AnswerCubit>(context), true),
            buildAnswerButton(BlocProvider.of<AnswerCubit>(context), false),
            getNextQuestionButton(BlocProvider.of<AnswerCubit>(context))
          ],
        );
      },
    );
  }

  ElevatedButton getNextQuestionButton(AnswerCubit answerCubit) {
    return ElevatedButton(
      onPressed: () {
        answerCubit.incrementQuestionIndex();
      },
      child: const Icon(Icons.arrow_right),
    );
  }

  ElevatedButton buildAnswerButton(AnswerCubit answerCubit, bool stateButton) {
    String message = stateButton ? "Vrai" : "Faux";

    return ElevatedButton(
      onPressed: () {
        answerCubit.checkAnswer(stateButton);
      },
      child: Text(message),
    );
  }
}