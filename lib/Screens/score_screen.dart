import 'package:flutter/material.dart';
import 'package:quiz_app_using_api/Screens/quiz_screen.dart';

class ScoreScreen extends StatelessWidget {
  final int score;

  ScoreScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Score:',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(height: 20),
            Text(
              '$score %',
              style: const TextStyle(color: Colors.white, fontSize: 60),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => QuizScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Do Again',
                    style: TextStyle(fontSize: 30),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
