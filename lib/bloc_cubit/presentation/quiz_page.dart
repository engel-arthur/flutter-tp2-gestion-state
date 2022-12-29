import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_gestion_state/bloc_cubit/business_logic/cubit/answer_cubit.dart';
import 'package:tp2_gestion_state/bloc_cubit/presentation/question_box.dart';
import 'package:tp2_gestion_state/bloc_cubit/presentation/results_box.dart';

class QuizPageCubit extends StatelessWidget {
  const QuizPageCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TP2 - Quizz')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocBuilder<AnswerCubit, AnswerState>(
                builder: (context, state) {
                  return _getNextWidget(state);
                },
              ),
            )
          ],
        ));
  }

  Widget _getNextWidget(AnswerState answerState) {
    bool quizOver = answerState.quizOver;

    if (!quizOver) {
      return const QuestionBox();
    } else {
      return const ResultsBox();
    }
  }
}