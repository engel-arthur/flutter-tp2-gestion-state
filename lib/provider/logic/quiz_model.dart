import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tp2_gestion_state/provider/logic/question.dart';

class QuizModel extends ChangeNotifier {
  final List<Question> _questions = [
    Question(
        urlImage: 'assets/images/doudou.jpg',
        questionText: "Ceci est un chien",
        isCorrect: false,
        answerText: "Faux. Ceci n'est pas un chien"),
    Question(
        urlImage: 'assets/images/algebra.jpg',
        questionText: "2+2 font 5",
        isCorrect: true,
        answerText:
            "Vrai. En prenant en compte la marge d'erreur, 2+2 font 5."),
    Question(
        urlImage: 'assets/images/eiffel.jpeg',
        questionText: "Paris se situe en France",
        isCorrect: false,
        answerText: "Faux. Paris Hilton réside en amérique.")
  ];
  int questionIndex = 0;
  int score = 0;
  bool answered = false;

  UnmodifiableListView<Question> get questions =>
      UnmodifiableListView(_questions);

  void checkAnswer(bool answer) {
    if (!answered && questions[questionIndex].isCorrect == answer) {
      score++;
    }
    answered = true;
    notifyListeners();
  }

  void incrementQuestionIndex() {
    if (answered) {
      answered = false;
      questionIndex++;
      notifyListeners();
    }
  }
}
