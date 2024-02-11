import 'package:flutter/material.dart';
import 'package:quiz_app_using_api/Screens/quiz_screen.dart';
import 'package:quiz_app_using_api/Screens/score_screen.dart';

import '../widgets/texts_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/quiz.png'),
            const SizedBox(
              height: 30,
            ),
            const TextsSplashScreen(
              txt: 'Welcome to our',
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            const TextsSplashScreen(
              txt: 'Quiz App',
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextsSplashScreen(
                txt: 'Do you feel confident ? Here you will face',
                fontWeight: FontWeight.w400,
                fontSize: 18),
            const TextsSplashScreen(
                txt: 'our most difficult questions!',
                fontWeight: FontWeight.w400,
                fontSize: 18),
            const SizedBox(
              height: 180,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => QuizScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 15, left: 100, right: 100, bottom: 15),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
