import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tp2_gestion_state/bloc_cubit/business_logic/cubit/answer_cubit.dart';
import 'package:tp2_gestion_state/bloc_cubit/presentation/quiz_page.dart';
import 'package:tp2_gestion_state/provider/logic/quiz_model.dart';
import 'package:tp2_gestion_state/main/exercise_selector.dart';
import 'package:tp2_gestion_state/meteo/presentation/pages/meteo_page.dart';
import 'package:tp2_gestion_state/provider/presentation/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2 - Interfaces graphiques',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ExerciseSelectorPage(),
        '/quizProvider': (context) => ChangeNotifierProvider(
            create: (context) => QuizModel(), child: const QuizPageProvider()),
        '/quizCubit': (context) => BlocProvider(
            create: (context) => AnswerCubit(), child: const QuizPageCubit()),
        '/meteo': (context) => const MeteoPage(),
      },
    );
  }
}
