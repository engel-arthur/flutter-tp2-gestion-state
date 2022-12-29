import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_gestion_state/bloc_cubit/business_logic/cubit/answer_cubit.dart';
import 'package:tp2_gestion_state/bloc_cubit/presentation/padded_text.dart';
import 'package:tp2_gestion_state/bloc_cubit/presentation/quiz_buttons.dart';

import '../data/model/question.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
            child: BlocBuilder<AnswerCubit, AnswerState>(
            builder: (context, state) {
              return Column(children: _generateQuizElements(BlocProvider.of<AnswerCubit>(context), state));
            })
        ),
      ],
    );
  }

  List<Widget> _generateQuizElements(AnswerCubit answerCubit, AnswerState answerState) {
    bool answered = answerState.answered;
    Question question = answerCubit.getCurrentQuestion();

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