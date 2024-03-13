import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_math_homework/controller.dart';
import 'package:kids_math_homework/detail_screen/title/question_title.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/random.dart';
import 'package:kids_math_homework/my_widgets/total_results.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
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

  List<List<int>> questions = [];

  int ans1 = 0;
  int ans2 = 0;
  int ans3 = 0;
  int ans4 = 0;
  int ans5 = 0;
  int ans6 = 0;
  int ans7 = 0;
  int ans8 = 0;
  int ans9 = 0;
  int ans10 = 0;

  List<int> answers = [];

  int right = 0;
  int wrong = 0;

  String trueAndFalseAnswer = '';
  String totalAnswer = '';
  bool isTimer = true;
  int count = 0;
  List<bool> enableList = List.generate(10, (index) => true);
  // List<bool> enableList = [true, true, true, true, true, true, true, true, true, true];
  bool isEnable = true;

  late VoidCallback cancelListening;

  void increment() {
    setState(() {
      ++right;
      trueAndFalseAnswer += 'မှန် ။';
    });
  }

  void decrement() {
    setState(() {
      ++wrong;
      trueAndFalseAnswer += 'မှား ။';
    });
  }

  int largeNumber(int n1, int n2) {
    int large = max(n1, n2);
    return large;
  }

  checkResult(int num1, int num2, int ans) {
    int q = largeNumber(num1, num2);
    if (q.compareTo(ans) == 0) {
      increment();
    } else {
      decrement();
    }

    if (answers.length == (right + wrong)) {
      //show Result with Dialog
      totalResultDialog(
          text: Text(
              '${totalResults(trueAndFalseAnswer)} \n မှန် ($right)ခု + မှား ($wrong)ခု = (${right + wrong}) ခု'
                  .toMM()),
          timer: true);
      //adding results to String
      totalAnswer += 'မှန်-$right + မှား-$wrong ။';

      Provider.of<MyProvider>(context, listen: false).answerSave1(totalAnswer);
      Provider.of<MyProvider>(context, listen: false).increment1();
      isTimer = !isTimer;
      // restart();
    }
  }

  void generate() {
    List.generate(10, (index) => questions[index] = randomGenerateList(2));
  }

  @override
  void initState() {
    questions = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10];
    answers = [
      ans1,
      ans2,
      ans3,
      ans4,
      ans5,
      ans6,
      ans7,
      ans8,
      ans9,
      ans10,
    ];
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Screen three')),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Column(
                children: [
                  QuestionTitle(
                      text: 'မည်သည့်ကိန်းက ကြီးသနည်း', isTimer: isTimer),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          totalResultDialog(
                              text: Consumer<MyProvider>(
                                  builder: (_, myProvider, child) {
                                return Text(
                                    totalResults(myProvider.answerString1)
                                        .toMM());
                              }),
                              timer: true);
                        },
                        child: const Text('ရလဒ်များ'),
                      ),
                      Positioned(
                          top: -5,
                          right: -5,
                          child: Consumer<MyProvider>(
                              builder: (_, myProvider, child) {
                            return myProvider.count1 == 0
                                ? const Text('')
                                : CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      // '${context.read<myController>().count}',
                                      '${myProvider.count1}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  );
                          }))
                    ],
                  ),
                ],
              )),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < questions.length; i++)
                      questionsRow(
                          no: i + 1, question: questions[i], answer: answers[i], enable: enableList[i])
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget questionsRow({
    required int no,
    required List<int> question,
    required int answer,
    required bool enable,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Column(
        children: [
          CircleAvatar(
            child: Text(no.toString().toMM()),
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200),
                child: GridView.builder(
                    primary: false,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 50, crossAxisSpacing: 50),
                    itemCount: question.length,
                    itemBuilder: (context, index) {
                  return  OutlinedButton(
                       onPressed: !enable
                          ? null
                          : () {
                            setState(() {
                               enableList[no-1] = false;
                              answer = question[index];
                              checkResult(question[0], question[1], answer);                          
                            });
                            },
                       child: Text(question[index].toString().toMM(), style: const TextStyle(fontSize: 16),),);
                  
                    }),
              ),
              const Spacer()
            ],
          ),
        
        ],
      ),
    );
  }

  void totalResultDialog({required Widget text, required bool timer}) {
    showDialog(
      barrierDismissible: false,
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: const Text('ရလဒ်များ'),
          content: SingleChildScrollView(child: text),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration.zero,
                          pageBuilder: (_, __, ___) => const ScreenOne()),
                      ModalRoute.withName('/'));
                  setState(() {
                    isTimer = timer;
                  });
                },
                child: const Text('ပိတ်မည်')),
          ],
        );
      },
    );
  }
}
