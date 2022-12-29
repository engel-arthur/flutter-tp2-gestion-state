import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_gestion_state/bloc_cubit/data/repository/questions_repository.dart';

import '../../data/model/question.dart';


part 'answer_state.dart';

class AnswerCubit extends Cubit<AnswerState> {

  UnmodifiableListView<Question> questionsRepository = QuestionsRepository.questions;

  AnswerCubit() : super(AnswerState(answered: false, questionIndex: 0, score: 0, quizOver: false));

  void checkAnswer(bool answer) {
    if (!state.answered && questionsRepository[state.questionIndex].isCorrect == answer) {
      emit(AnswerState(answered: true, questionIndex: state.questionIndex, score: state.score + 1, quizOver: false));
    }
    else {
      emit(AnswerState(answered: true, questionIndex: state.questionIndex, score: state.score, quizOver: false));
    }
  }

  void incrementQuestionIndex() {
    if (state.answered) {
      if (state.questionIndex == questionsRepository.length - 1) {
        emit(AnswerState(answered: false, questionIndex: (state.questionIndex + 1), score: state.score, quizOver: true));
      }
      else {
        emit(AnswerState(answered: false, questionIndex: (state.questionIndex + 1), score: state.score, quizOver: false));
      }
    }
  }

  Question getCurrentQuestion() {
    return questionsRepository[state.questionIndex];
  }

}
