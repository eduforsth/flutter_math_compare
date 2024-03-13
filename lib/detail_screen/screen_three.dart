import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_homework/controller.dart';
import 'package:kids_math_homework/detail_screen/dialog/show_dialog.dart';
import 'package:kids_math_homework/detail_screen/title/question_title.dart';
import 'package:kids_math_homework/my_widgets/buttons/puzzel_btn.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/random.dart';
import 'package:kids_math_homework/my_widgets/total_results.dart';
import 'package:provider/provider.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
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

  List<int> ans1 = [];
  List<int> ans2 = [];
  List<int> ans3 = [];
  List<int> ans4 = [];
  List<int> ans5 = [];
  List<int> ans6 = [];
  List<int> ans7 = [];
  List<int> ans8 = [];
  List<int> ans9 = [];
  List<int> ans10 = [];

  List<List<int>> answers = [];

  int right = 0;
  int wrong = 0;

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

  void generate() {
    List.generate(10, (index) => questions[index] = randomGenerateList(5));
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
        appBar: AppBar(title: const Text('Screen Three')),
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
                    text: 'ကြီးစဉ်ငယ်လိုက်စီပါ',
                    isTimer: isTimer,
                    minutes: 1,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Dialogs.showMyDialog(
                            text: Consumer<MyProvider>(
                                builder: (_, myProvider, child) {
                              return Text(totalResults(myProvider.answerString3)
                                  .toMM());
                            }),
                            parentContext: context,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (_, __, ___) =>
                                          const ScreenThree()),
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
                            return myProvider.count3 == 0
                                ? const Text('')
                                : CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      // '${context.read<myController>().count}',
                                      '${myProvider.count3}',
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
                          no: i + 1, question: questions[i], answer: answers[i])
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
    required List<int> answer,
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
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: GridView.builder(
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: question.length,
                itemBuilder: (context, index) {
                  return PuzzelBtn(
                    text: question[index].toString(),
                    onPressed: () {
                      answer.add(question[index]);
                      if (question.length == answer.length) {
                        List<int> ls = List.from(question);
                        ls.sort((a, b) => b.compareTo(a));
                        if (listEquals(ls, answer)) {
                          increment();
                        } else {
                          decrement();
                        }

                        if (answers.length == (right + wrong)) {
                          Dialogs.showMyDialog(
                            text: Consumer<MyProvider>(
                                builder: (_, myProvider, child) {
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
                                      pageBuilder: (_, __, ___) =>
                                          const ScreenThree()),
                                  ModalRoute.withName('/'));
                              setState(() {
                                isTimer = true;
                              });
                            },
                          );

                          //adding results to String
                          totalAnswer += 'မှန်-$right + မှား-$wrong ။';

                          Provider.of<MyProvider>(context, listen: false)
                              .answerSave3(totalAnswer);
                          Provider.of<MyProvider>(context, listen: false)
                              .increment3();
                          isTimer = !isTimer;
                          // restart();
                        }
                      }
                    },
                    // isEnable: false,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
