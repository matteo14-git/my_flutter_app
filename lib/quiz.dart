import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/question.dart';

class Quiz extends StatelessWidget {
  final Question question;
  final Function eval;

  const Quiz({required this.question, required this.eval});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          question.question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        ElevatedButton(
          onPressed: () => eval(question.answer, true),
          child: Text('TRUE'),
        ),
        ElevatedButton(
          onPressed: () => eval(question.answer, false),
          child: Text('FALSE'),
        ),
      ],
    );
  }
}
