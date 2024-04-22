import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizApp();
}

class _QuizApp extends State<QuizApp> {
  int quecount = 0;
  List<String> questionList = [
    "Who is the Prime Minister of India",
    "Who is the President Of India",
    "How many no of seat are in Vidhan Sabha",
    "Who is the chairPerson of the organstion"
  ];
  String question = "";
  String optionA = "";
  String optionB = "";
  String optionC = "";
  String optionD = "";

  List<String> optionBList = [
    "Rahul Gandhi ",
    "Manmohan Singh",
    "800",
    "Aditya"
  ];
  List<String> optionCList = [
    "Lala Lachpat Rai ",
    "Pranvan muhkraji",
    "678",
    "Ronak"
  ];
  List<String> optionDList = [
    "Mamta Banerji ",
    "Rahul Gandhi",
    "976",
    "Patil Om"
  ];

  List<String> optionAList = [
    "Narendra Modi ",
    "APJ Abdul Kalam",
    "234",
    "Om Singh"
  ];

  List<int> ans = [1, 2, 1, 4];
  int anser = 0;

  void sendQuestion() {
    for (int i = 0; i <= 4; i++) {
      if (quecount == i + 1) {
        question = questionList[i];
        optionA = optionAList[i];
        optionB = optionBList[i];
        optionC = optionCList[i];
        optionD = optionDList[i];
        // return question;
        break;
      } else if (quecount > questionList.length) {
        quecount = 1;
        question = questionList[1];
        optionA = optionAList[1];
        optionB = optionBList[1];
        optionC = optionCList[1];
        optionD = optionDList[1];
        break;
      }
    }
  }

  Colors color = Colors.blue;
  bool pressedbuttonofcolor = false;
  List<Color> color = [Colors.blue, Colors.blue, Colors.blue, Colors.blue];

  void setcolor(int n, bool x) {
    if (x == true) {
      if (ans[quecount] == n) {
        if (quecount == 1) {
          return color = Color.green;
        } else if (quecount == 2) {
          return color = Color.green;
        } else if (quecount == 3) {
          return color = Color.green;
        } else if (quecount == 4) {
          return color = Color.green;
        }
      } else {
        if (quecount == 1) {
          return Color.red;
        } else if (quecount == 2) {
          return Color.red;
        } else if (quecount == 3) {
          return Color.red;
        } else if (quecount == 4) {
          return Color.red;
        } else
          return Color.red;
      }
    }
  }

  bool pressed = false;
  bool pressedbutton() => pressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (pressedbutton() == true) {
                  quecount++;
                  sendQuestion();
                  pressed = false;
                  pressedbuttonofcolor = false;
                  for (int i = 0; i < color.length; i++) {
                    color[i] = Colors.blue;
                  }
                }
              });
            },
            child: const Text("NEXT")),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Quiz APP",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.red),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Questions:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(
                  width: 2,
                ),
                Text("$quecount/4",
                    style: const TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 600,
              height: 40,
              child: Text(" $question ",
                  style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  pressed = true;
                  pressedbuttonofcolor = true;
                  // predd(1);
                },
                style: ElevatedButton.styleFrom(
                 //   primary: setcolor(1, pressedbuttonofcolor)),
                child: Text("A $optionA")),
            const  SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  pressed = true;
                  //pressedbuttonofcolor = true;
                  //predd(2);
                },
                style: ElevatedButton.styleFrom(
                   // primary: setcolor(2, pressedbuttonofcolor)
                   // ),
                child: Text("B $optionB")),
            child: const SizedBox(
              height: 10,
            ),
           ElevatedButton(
                onPressed: () {
                  pressed = true;
                  //pressedbuttonofcolor = true;
                  //predd(4);
                },
               // style: ElevatedButton.styleFrom(
                 //   primary: setcolor(3, pressedbuttonofcolor)
                  //  ),
                child: Text("C  $optionC")
                ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  pressed = true;
                  //pressedbuttonofcolor = true;
                  //predd(4);
                },
                //style: ElevatedButton.styleFrom(
                //    primary: setcolor(4, pressedbuttonofcolor)),
                child: Text("D $optionD")),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
