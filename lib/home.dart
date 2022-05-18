import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/question.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int questionIndex = 0;
    int score = 0;

    void eval(bool correctAnswer, bool givenAnswer) {
      if (correctAnswer == givenAnswer) {
        score++;
      }
      questionIndex++;
      print('QI $questionIndex');
      print('score $score');
    }

    List<Question> questions = [
      Question(
          question: 'Il cavallo bianco di Napoleone era bianco?', answer: true),
      Question(question: 'Vero è falso?', answer: false),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('My app'),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                questions[questionIndex].question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                onPressed: () => eval(questions[questionIndex].answer, true),
                child: Text('TRUE'),
              ),
              ElevatedButton(
                onPressed: () => eval(questions[questionIndex].answer, true),
                child: Text('FALSE'),
              ),
              Text(
                'Il tuo punteggio è 0',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
