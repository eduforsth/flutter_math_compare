import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/random.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
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

  List<int> selectedList01 = [];

  List<bool> isAnswer1 = [false,false,false,false,false,];
  List<bool> isAnswer2 = [false,false,false,false,false,];
  List<bool> isAnswer3 = [false,false,false,false,false,];
  List<bool> isAnswer4 = [false,false,false,false,false,];
  List<bool> isAnswer5 = [false,false,false,false,false,];
  List<bool> isAnswer6 = [false,false,false,false,false,];
  List<bool> isAnswer7 = [false,false,false,false,false,];
  List<bool> isAnswer8 = [false,false,false,false,false,];
  List<bool> isAnswer9 = [false,false,false,false,false,];
  List<bool> isAnswer10 = [false,false,false,false,false,];

  int right = 0;
  int wrong = 0;
// bool isTimer = false;

  void generate() {
    for (int i = 0; i < 5; i++) {
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
      selectedList01.clear();
      isAnswer1.clear();
      isAnswer2.clear();
      isAnswer3.clear();
      isAnswer4.clear();
      isAnswer5.clear();
      isAnswer6.clear();
      isAnswer7.clear();
      isAnswer8.clear();
      isAnswer9.clear();
      isAnswer10.clear();
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
      isAnswer1.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer2.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer3.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer4.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer5.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer6.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer7.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer8.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer9.addAll([false,false,false,false,false,false,false,false,false,false]);
      isAnswer10.addAll([false,false,false,false,false,false,false,false,false,false]);
      generate();
    });
  }

  List sortSmallToBig(List<int> ls) {
    var q = (ls..sort());
    // var q = (q1..sort());
    return q;
  }

  void compare(List<int> ls) {
    if (selectedList01.length == 5) {
      if (sortSmallToBig(ls).toString() == selectedList01.toString()) {
        right++;
      } else {
        wrong++;
      }
        selectedList01.clear();
        resultDialog();
    }
  }

  void checkRow(int num, int index){
    switch(num){
      case 0:
    isAnswer1[index] = true;
      break;
      case 1:
    isAnswer2[index] = true;
      break;
      case 2:
    isAnswer3[index] = true;
      break;
      case 3:
    isAnswer4[index] = true;
      break;
      case 4:
    isAnswer5[index] = true;
      break;
      case 5:
    isAnswer6[index] = true;
      break;
      case 6:
    isAnswer7[index] = true;
      break;
      case 7:
    isAnswer8[index] = true;
      break;
      case 8:
    isAnswer9[index] = true;
      break;
      case 9:
    isAnswer10[index] = true;
      break;
    }
  }

  void resultDialog(){
                         if (right + wrong == 10) {
                          showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('ရလဒ်များ'),
                                content:
                                    Text('အဖြေမှန်-> ${languageChange(right.toString())} | မှား-> ${languageChange(wrong.toString())}'),
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

  @override
  void initState() {
    super.initState();
    generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Three'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
         const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text('ငယ်စဉ်ကြီးလိုက်စီပါ')),
            //  CircleAvatar(child: isTimer? tweenTimer(60) : tweenTimer(60))
            ],
          ),
        ),
        //  Text(sortBigToSmall().toString()),
        //  Text(selectedList01.toString()),
        // Text(sortBigToSmall().reversed.toString()),
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
              answerRow(no: 1, num: q1, check: isAnswer1),
              answerRow(no: 2, num: q2, check: isAnswer2),
              answerRow(no: 3, num: q3, check: isAnswer3),
              answerRow(no: 4, num: q4, check: isAnswer4),
              answerRow(no: 5, num: q5, check: isAnswer5),
              answerRow(no: 6, num: q6, check: isAnswer6),
              answerRow(no: 7, num: q7, check: isAnswer7),
              answerRow(no: 8, num: q8, check: isAnswer8),
              answerRow(no: 9, num: q9, check: isAnswer9),
              answerRow(no: 10, num: q10, check: isAnswer10),
            ],
          ),
        )
      ]),
    );
  }

  Widget answerRow(
      {required int no, required List<int> num, required List<bool> check}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400, width: 2),),
      child: Column(
        children: [
          CircleAvatar(
            child: Text(languageChange(no.toString())),
          ),
          // Text(num.toString()),
          // Text(sortBigToSmall(num).toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: check[0]
                    ? null
                    : () {
                        setState(() {
                          // isAnswer1[0] = true;
                          checkRow(no-1, 0);
                          selectedList01.add(num[0]);
                          compare(num);
                        });
                      },
                child: Text(languageChange('${num[0]}')),
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
              ),
              OutlinedButton(
                onPressed: check[1]
                    ? null
                    : () {
                        setState(() {
                          // isAnswer1[1] = true;
                          checkRow(no-1, 1);
                          selectedList01.add(num[1]);
                          compare(num);
                        });
                      },
                child: Text(languageChange('${num[1]}')),
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
              ),
              OutlinedButton(
                onPressed: check[2]
                    ? null
                    : () {
                        setState(() {
                          // isAnswer1[2] = true;
                          checkRow(no-1, 2);

                          selectedList01.add(num[2]);
                          compare(num);
                        });
                      },
                child: Text(languageChange('${num[2]}')),
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
              ),
              OutlinedButton(
                onPressed: check[3]
                    ? null
                    : () {
                        setState(() {
                          // isAnswer1[3] = true;
                          checkRow(no-1, 3);

                          selectedList01.add(num[3]);
                          compare(num);
                        });
                      },
                child: Text(languageChange('${num[3]}')),
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
              ),
              OutlinedButton(
                onPressed: check[4]
                    ? null
                    : () {
                        setState(() {
                          // isAnswer1[4] = true;
                          checkRow(no-1, 4);

                          selectedList01.add(num[4]);
                          compare(num);
                        });
                      },
                child: Text(languageChange('${num[4]}')),
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
