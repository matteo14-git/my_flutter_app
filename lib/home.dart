import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/question.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int questionIndex = 0;
  int score = 0;
  List<Question> questions = [
    Question(
        question: 'Il cavallo bianco di Napoleone era bianco?', answer: true),
    Question(question: 'Vero è falso?', answer: false),
  ];

  @override
  Widget build(BuildContext context) {
    void eval(bool correctAnswer, bool givenAnswer) {
      setState(() {
        if (correctAnswer == givenAnswer) {
          score = score + 1;
        }
        questionIndex = questionIndex + 1;
        if (questionIndex >= questions.length) {
          questionIndex = 0;
        }
      });
    }

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
                onPressed: () => eval(questions[questionIndex].answer, false),
                child: Text('FALSE'),
              ),
              Text(
                'Il tuo punteggio è $score',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
