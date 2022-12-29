import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_gestion_state/bloc_cubit/business_logic/cubit/answer_cubit.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [BlocBuilder<AnswerCubit, AnswerState>(
          builder: (context, state) {
            int score = state.score;
            return Text("Vous avez marqué $score point(s).");
          },
        )
        ]),
      ),
    );
  }
}