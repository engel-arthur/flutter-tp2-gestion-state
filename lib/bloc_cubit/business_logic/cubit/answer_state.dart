part of 'answer_cubit.dart';

class AnswerState {
  bool answered;
  int questionIndex;
  int score;
  bool quizOver;

  AnswerState({
    required this.answered,
    required this.questionIndex,
    required this.score,
    required this.quizOver
  });
}
