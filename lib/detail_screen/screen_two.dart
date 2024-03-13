import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_math_homework/controller.dart';
import 'package:kids_math_homework/detail_screen/dialog/show_dialog.dart';
import 'package:kids_math_homework/detail_screen/title/question_title.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/random.dart';
import 'package:kids_math_homework/my_widgets/total_results.dart';
import 'package:provider/provider.dart';

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

  List<List<int>> questions = [];
  //selected question default in radio
  List<int> selectedQ = [];

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

//to show single list dialog
  String trueAndFalseAnswer = '';
  String totalAnswer = '';
  bool isTimer = true;

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

  int smallNumber(int n1, int n2) {
    int large = min(n1, n2);
    return large;
  }

  void checkResult() {
    List<int> cAnswerList = [];

    for (int i = 0; i < answers.length; i++) {
      // true answer
      int cAnswer = smallNumber(questions[i][0], questions[i][1]);
      //user answer add to list
      answers[i] = selectedQ[i];
      //true answer add to list
      cAnswerList.add(cAnswer);

      if (answers[i] == cAnswerList[i]) {
        increment();
      } else {
        decrement();
      }
    }

    if (answers.length == (right + wrong)) {
      Dialogs.showMyDialog(
        text: Consumer<MyProvider>(builder: (_, myProvider, child) {
          return Text(
              '${totalResults(trueAndFalseAnswer)} \n မှန် ($right)ခု + မှား ($wrong)ခု = (${right + wrong}) ခု'
                  .toMM());
        }),
        parentContext: context,
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (_, __, ___) => const ScreenTwo()),
              ModalRoute.withName('/'));
          setState(() {
            isTimer = true;
          });
        },
      );

      //adding results to String
      totalAnswer += 'မှန်-$right + မှား-$wrong ။';

      Provider.of<MyProvider>(context, listen: false).answerSave2(totalAnswer);
      Provider.of<MyProvider>(context, listen: false).increment2();
      isTimer = !isTimer;
    }
  }

  void generate() {
    // questions List with array containing two paras
    List.generate(10, (index) => questions[index] = randomGenerateList(2));
    // user selected Answers List
    selectedQ = List.generate(10, (index) => questions[index][0]);
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
      appBar: AppBar(title: const Text('Screen Two')),
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
                QuestionTitle(text: 'မည်သည့်ကိန်းက ငယ်သနည်း', isTimer: isTimer),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Dialogs.showMyDialog(
                          text: Consumer<MyProvider>(
                              builder: (_, myProvider, child) {
                            return Text(
                                totalResults(myProvider.answerString2).toMM());
                          }),
                          parentContext: context,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    transitionDuration: Duration.zero,
                                    pageBuilder: (_, __, ___) =>
                                        const ScreenTwo()),
                                ModalRoute.withName('/'));
                            setState(() {
                              isTimer = true;
                            });
                          },
                        );
                      },
                      child: const Text('ရလဒ်များ'),
                    ),
                    Positioned(
                        top: -5,
                        right: -5,
                        child: Consumer<MyProvider>(
                            builder: (_, myProvider, child) {
                          return myProvider.count2 == 0
                              ? const Text('')
                              : CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    // '${context.read<myController>().count}',
                                    '${myProvider.count2}',
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
                      idx: i,
                      question: questions[i],
                      answer: answers[i],
                    )

                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkResult();
        },
        child: const Icon(Icons.question_mark_outlined),
      ),
    );
  }

  Widget questionsRow({
    required int idx,
    required List<int> question,
    required int answer,
    // required bool enable,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Column(
        children: [
          CircleAvatar(
            child: Text((idx + 1).toString().toMM()),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 50),
                    itemCount: question.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Radio<int>(
                              value: question[index],
                              groupValue: selectedQ[idx],
                              onChanged: (val) {
                                setState(() {
                                  selectedQ[idx] = val!;
                                  debugPrint(selectedQ[idx].toString());
                                });
                              }),
                          selectedQ[idx] == question[index]
                              ? Text(
                                  question[index].toString().toMM(),
                                  style: const TextStyle(fontSize: 18),
                                )
                              : Text(question[index].toString().toMM())
                        ],
                      );
                    }),
              ),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
