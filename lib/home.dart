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
  bool resetQuiz = false;
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
          resetQuiz = true;
        }
      });
    }

    void reset() {
      setState(() {
        questionIndex = 0;
        score = 0;
        resetQuiz = false;
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
            children: resetQuiz
                ? [
                    Text(
                      'Il tuo punteggio è $score',
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: reset,
                      child: Text('Reset'),
                    ),
                  ]
                : [
                    Text(
                      questions[questionIndex].question,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          eval(questions[questionIndex].answer, true),
                      child: Text('TRUE'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          eval(questions[questionIndex].answer, false),
                      child: Text('FALSE'),
                    ),
                  ],
          ),
        ));
  }
}
