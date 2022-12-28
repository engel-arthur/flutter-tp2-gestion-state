import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final questions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TP1 - Quizz')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: _getNextWidget()),
          ],
        ));
  }

  void _checkAnswer(bool answer) {
    if (!answered && questions[questionIndex].isCorrect == answer) {
      setState(() {
        score++;
      });
    }
    setState(() {
      answered = true;
    });
  }

  void _incrementQuestionIndex() {
    if(answered) {
      setState(() {
        answered = false;
        questionIndex++;
      });
    }
  }

  Widget _getNextWidget() {
    if (questionIndex < questions.length) {
      return QuestionBox(
        question: questions[questionIndex],
        generateQuizElements: _generateQuizElements,
      );
    } else {
      return ResultsBox(score: score);
    }
  }

  List<Widget> _generateQuizElements(Question question) {
    List<Widget> widgets = [
      PaddedText(text: question.questionText),
      Image.asset(question.urlImage, width: 300),
      QuizButtons(
        checkAnswer: _checkAnswer,
        incrementQuestionIndex: _incrementQuestionIndex,
      )
    ];
    if(answered) {
      widgets.add(PaddedText(text: question.answerText));
    }
    return widgets;
  }
}

class QuestionBox extends StatelessWidget {
  final Question question;
  final Function generateQuizElements;

  const QuestionBox(
      {Key? key,
        required this.question,
        required this.generateQuizElements})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Column(
              children: generateQuizElements(question)
          ),
        ),
      ],
    );
  }
}

class Question {
  String urlImage;
  String questionText;
  bool isCorrect;
  String answerText;

  Question(
      {required this.urlImage,
        required this.questionText,
        required this.isCorrect,
        required this.answerText});
}

class PaddedText extends StatelessWidget {
  const PaddedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}

class QuizButtons extends StatelessWidget {
  final Function checkAnswer;
  final Function incrementQuestionIndex;

  const QuizButtons(
      {Key? key,
        required this.checkAnswer,
        required this.incrementQuestionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            checkAnswer(true);
          },
          child: const Text("Vrai"),
        ),
        ElevatedButton(
          onPressed: () {
            checkAnswer(false);
          },
          child: const Text("Faux"),
        ),
        ElevatedButton(
          onPressed: () {
            incrementQuestionIndex();
          },
          child: const Icon(Icons.arrow_right),
        )
      ],
    );
  }
}

class ResultsBox extends StatelessWidget {
  final int score;

  const ResultsBox({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [Text("Vous avez marqué $score point(s).")]),
      ),
    );
  }
}
