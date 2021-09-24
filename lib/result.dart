import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String finalPhrase = "You did it!";
    if (resultScore <= 10) {
      finalPhrase = "You are good! You need to practice!";
    } else if (resultScore <= 15) {
      finalPhrase = "You are awesome!";
    } else if (resultScore <= 20) {
      finalPhrase = "You are pretty!";
    } else {
      finalPhrase = "You are bad!";
    }
    return finalPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            "Restart Quiz!",
          ),
          textColor: Colors.blue,
          onPressed: resetQuiz,
        )
      ],
    ));
  }
}
