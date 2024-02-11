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
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/balloon2.png'),
          const SizedBox(
            height: 10,
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
            height: 100,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => QuizScreen()));
            },
            child: Container(
              width: 340,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
