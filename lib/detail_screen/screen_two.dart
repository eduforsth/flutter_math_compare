import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/timer.dart';
import 'package:kids_math_homework/random.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => ScreenTwoState();
}

class ScreenTwoState extends State<ScreenTwo> {

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
  bool isTimer = true;

  List<int> selected = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

  int count = 0;
  List<String> results = [];

  List<bool> isShow = [
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
      // isTimer = false;
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
      isShow.clear();
      isShow.addAll([
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

  String totalResults() {
    String str = '';
    for (int i = 0; i < results.length; i++) {
      str += '${languageChange((i + 1).toString())}။ ${results[i]} \n';
    }
    return str;
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(child: Text('မည်သည့်ကိန်းဂဏန်းက ငယ်သနည်း။')),
              CircleAvatar(
                  child: isTimer ? tweenTimer(30, 1) : const Text('?'))
            
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              OutlinedButton(
                  onPressed: () {
                    resultDialog(str: totalResults());
                  },
                  child: const Text('ရလဒ်များ')),
                  Positioned(  
                    top: -5,
                    right: -5,
                    child: count ==0? const Text('') : CircleAvatar(child: Text(languageChange('$count'), style: const TextStyle(color: Colors.white, fontSize: 13),), radius: 12, backgroundColor: Colors.red,))
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
                        if (right + wrong == 10) {
                          count++;
                          isTimer = !isTimer;  

                          resultDialog(
                              str:
                                  'အဖြေမှန်-> ${languageChange(right.toString())} | မှား-> ${languageChange(wrong.toString())}');
                          results.add(languageChange('မှန် = ($right) ခု + မှား = ($wrong) ခု'));
                        restart();
                        }
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
                        if (right + wrong == 10) {
                          count++;
                          isTimer = !isTimer;                            

                          print(isTimer);
                          resultDialog(
                              str:
                                  'အဖြေမှန်-> ${languageChange(right.toString())} | မှား-> ${languageChange(wrong.toString())}');
                          results.add(languageChange('မှန် = ($right) ခု + မှား = ($wrong) ခု'));
                          restart();
                        }
                      });
                    },
              child: selected[no - 1] == num2
                  ? Text(
                      languageChange(num2.toString()),
                      style: const TextStyle(color: Colors.blue),
                    )
                  : Text(languageChange(num2.toString()))),
          isShow[no - 1]
              ? Text(languageChange(smallNumber(num1, num2).toString()))
              : InkWell(
                  onTap: () => setState(() {
                        isShow[no - 1] = true;
                      }),
                  child: CircleAvatar(
                    backgroundColor: Colors.amber.shade200,
                    child: const Text('?'),
                  ))
        ],
      ),
    );
  }

  void resultDialog({required String str}) {
    showDialog(
      barrierDismissible: false,
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: const Text('ရလဒ်များ'),
          content: Text(str),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    isTimer = true;
                  });
                },
                child: const Text('ပိတ်မည်'))
          ],
        );
      },
    );
  }

}