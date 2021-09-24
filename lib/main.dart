import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyQuizAppState();
  }
}

class _MyQuizAppState extends State<MyQuizApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite singer ?",
      "answers": [
        {"text": "Black", "score": 20},
        {"text": "Red", "score": 10},
        {"text": "Pink", "score": 15},
        {"text": "Green", "score": 5},
      ],
    },
    {
      "questionText": "What's your favorite country ?",
      "answers": [
        {"text": "USA", "score": 10},
        {"text": "UK", "score": 8},
        {"text": "Canada", "score": 15},
        {"text": "India", "score": 20}
      ],
    },
    {
      "questionText": "What's your favorite company ?",
      "answers": [
        {"text": "Google", "score": 20},
        {"text": "Microsoft", "score": 10},
        {"text": "Apple", "score": 5}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
