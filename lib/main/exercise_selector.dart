import 'package:flutter/material.dart';

class ExerciseSelectorPage extends StatelessWidget {
  const ExerciseSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP2 - Interfaces Graphiques'),
      ),
      body: const ExerciseSelector(),
    );
  }
}

class ExerciseSelector extends StatelessWidget {
  const ExerciseSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          ExerciseSelectorText(),
          ExerciseSelectorButtons(),
        ]
    );
  }
}


class ExerciseSelectorText extends StatelessWidget {
  const ExerciseSelectorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Choisissez un exercice.");
  }
}


class ExerciseSelectorButtons extends StatelessWidget {
  const ExerciseSelectorButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/meteo');
          },
          child: const Text("Météo"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/quiz');
          },
          child: const Text("Quizz"),
        )
      ],
    );
  }
}
