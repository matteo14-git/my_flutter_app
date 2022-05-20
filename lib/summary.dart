import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  
  final int score;
  final Function reset;

  const Summary({required this.score, required this.reset});

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
          onPressed: () => reset(),
          child: Text('Reset'),
        ),
      ],
    );
  }
}
