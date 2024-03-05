import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/timer.dart';
import 'package:kids_math_homework/random.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  List<int> q1 = [];
  List<int> q2 = [];
  List<int> q3 = [];
  List<int> q4 = [];
  List<int> q5 = [];
  List<int> q6 = [];
  List<int> q7 = [];
  List<int> q8 = [];
  List<int> q9 = [];
  List<int> q10 = [];

  bool isAnswer = false;
  bool isAnswer2 = false;
  bool isAnswer3 = false;
  bool isAnswer4 = false;
  bool isAnswer5 = false;
  bool isAnswer6 = false;
  bool isAnswer7 = false;
  bool isAnswer8 = false;
  bool isAnswer9 = false;
  bool isAnswer10 = false;

  List<bool> isAnswer1 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int right = 0;
  int wrong = 0;
  String itemResult = '';
  // bool isTimer = false;

  List<int> selected = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

  void generate() {
    for (int i = 0; i < 2; i++) {
      q1.add(randomGenerate());
      q2.add(randomGenerate());
      q3.add(randomGenerate());
      q4.add(randomGenerate());
      q5.add(randomGenerate());
      q6.add(randomGenerate());
      q7.add(randomGenerate());
      q8.add(randomGenerate());
      q9.add(randomGenerate());
      q10.add(randomGenerate());
    }
  }

    void restart() {
    setState(() {
      right = 0;
      wrong = 0;
      // isTimer = true;
      selected.clear();
      isAnswer1.clear();
      q1.clear();
      q2.clear();
      q3.clear();
      q4.clear();
      q5.clear();
      q6.clear();
      q7.clear();
      q8.clear();
      q9.clear();
      q10.clear();
      selected.addAll([-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]);
      isAnswer1.addAll([
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ]);
      generate();
    });
  }

  int smallNumber(int n1, int n2) {
    int small = min(n1, n2);
    return small;
  }

  @override
  void initState() {
    super.initState();
    generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text('မည်သည့်ကိန်းဂဏန်းက ငယ်သနည်း။')),
              // CircleAvatar(child: isTimer? tweenTimer(5) : tweenTimer(5))
            ],
          ),
        ),
                Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(languageChange('မှန်-$right | မှား-$wrong')),
              OutlinedButton(
                  onPressed: () {
                    restart();
                  },
                  child: Text('ပြန်စမည်'))
            ],
          ),
        ),
        
        Expanded(
          child: ListView(
            children: [
              answerRow(no: 1, num1: q1[0], num2: q1[1], check: isAnswer1[0]),
              answerRow(no: 2, num1: q2[0], num2: q2[1], check: isAnswer1[1]),
              answerRow(no: 3, num1: q3[0], num2: q3[1], check: isAnswer1[2]),
              answerRow(no: 4, num1: q4[0], num2: q4[1], check: isAnswer1[3]),
              answerRow(no: 5, num1: q5[0], num2: q5[1], check: isAnswer1[4]),
              answerRow(no: 6, num1: q6[0], num2: q6[1], check: isAnswer1[5]),
              answerRow(no: 7, num1: q7[0], num2: q7[1], check: isAnswer1[6]),
              answerRow(no: 8, num1: q8[0], num2: q8[1], check: isAnswer1[7]),
              answerRow(no: 9, num1: q9[0], num2: q9[1], check: isAnswer1[8]),
              answerRow(
                  no: 10, num1: q10[0], num2: q10[1], check: isAnswer1[9]),
            ],
          ),
        )
      ]),
    );
  }

  Widget answerRow(
      {required int no,
      required int num1,
      required int num2,
      required bool check}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: Text(languageChange('$no')),
          ),
          const SizedBox(
            width: 20,
          ),
          OutlinedButton(
              onPressed: check
                  ? null
                  : () {
                      setState(() {
                        isAnswer1[no - 1] = true;
                        selected[no - 1] = num1;
                        if (smallNumber(num1, num2) == num1) {
                          right++;
                          // print('right => $right');
                        } else {
                          wrong++;
                          // print('worong => $wrong');
                        }
                        resultDialog();
                      });
                    },
              child: selected[no - 1] == num1
                  ? Text(
                      languageChange(
                        num1.toString(),
                      ),
                      style: const TextStyle(color: Colors.blue),
                    )
                  : Text(languageChange(num1.toString()))),
          OutlinedButton(
              onPressed: check
                  ? null
                  : () {
                      setState(() {
                        isAnswer1[no - 1] = true;
                        selected[no - 1] = num2;
                        if (smallNumber(num1, num2) == num2) {
                          right++;
                          // print('right => $right');
                        } else {
                          wrong++;
                          // print('worong => $wrong');
                        }
                          resultDialog();
                      });
                    },
              child: selected[no - 1] == num2
                  ? Text(
                      languageChange(num2.toString()),
                      style: const TextStyle(color: Colors.blue),
                    )
                  : Text(languageChange(num2.toString()))),
        ],
      ),
    );
  }

  void resultDialog() {
    if (right + wrong == 10) {
    showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: const Text('ရလဒ်များ'),
          content: Text(
              'အဖြေမှန်-> ${languageChange(right.toString())} | မှား-> ${languageChange(wrong.toString())}'),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ပိတ်မည်'))
          ],
        );
      },
    );
  }
  }
}
