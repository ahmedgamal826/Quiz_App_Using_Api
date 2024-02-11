import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_using_api/Screens/score_screen.dart';
import 'package:quiz_app_using_api/Screens/splash_screen.dart';
import 'package:quiz_app_using_api/Services/api_services.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isSelected = false;
  var currentquestionIndex = 0;
  late Future quiz;
  bool isloaded = false;
  List optionList = [];
  List OptionsColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  int point = 0;

  resetColors() {
    OptionsColors = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  int seconds = 60;

  Timer? timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          moveToScorePage(); // Move to the score page when the timer reaches 0
        }
      });
    });
  }

  moveToScorePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(score: point),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: FutureBuilder(
        future: quiz,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data["results"];

            if (isloaded == false) {
              optionList = data[currentquestionIndex]["incorrect_answers"];
              optionList.add(data[currentquestionIndex]["correct_answer"]);
              optionList.shuffle();
              isloaded = true;
            }

            return ListView(physics: BouncingScrollPhysics(), children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white.withOpacity(.4)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SplashScreen()));
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                        Stack(alignment: Alignment.center, children: [
                          Text(
                            '$seconds',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              value: seconds / 60,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                        ]),
                        Container(
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                              icon: Icon(
                                CupertinoIcons.heart_fill,
                                color: isSelected ? Colors.red : Colors.white,
                              ),
                              label: const Text(
                                'Like',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Image.asset('assets/ideas.png', width: 200),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Question ${currentquestionIndex + 1} of ${data.length}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      data[currentquestionIndex]["question"],
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: optionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var answer = data[currentquestionIndex]["correct_answer"];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (answer.toString() ==
                                optionList[index].toString()) {
                              OptionsColors[index] = Colors.green;
                              point = point + 5; // because 100 / 20 = 5
                            } else {
                              OptionsColors[index] = Colors.red;
                            }

                            if (currentquestionIndex < data.length - 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                isloaded = false;
                                currentquestionIndex++;
                                resetColors();
                                timer!.cancel();
                                seconds = 60;
                                startTimer();
                              });
                            } else {
                              // Last question reached, navigate to the score page
                              moveToScorePage();
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: OptionsColors[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              optionList[index].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
