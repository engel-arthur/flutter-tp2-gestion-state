import 'package:flutter/material.dart';
import 'package:tp2_gestion_state/exercise_selector.dart';
import 'package:tp2_gestion_state/quiz.dart';
import 'package:tp2_gestion_state/meteo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1 - Interfaces graphiques',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ExerciseSelectorPage(),
        '/quiz': (context) => const QuizPage(),
        '/meteo' : (context) => const MeteoPage(),
      },
    );
  }
}
