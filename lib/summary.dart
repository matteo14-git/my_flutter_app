import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  // const Summary({Key? key}) : super(key: key);
  final score;
  final reset;

  const Summary({this.score, this.reset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Il tuo punteggio è $score',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: reset,
          child: Text('Reset'),
        ),
      ],
    );
  }
}
