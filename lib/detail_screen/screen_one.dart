import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_math_homework/controller.dart';
import 'package:kids_math_homework/detail_screen/buttons/question2_row.dart';
import 'package:kids_math_homework/detail_screen/dialog/show_dialog.dart';
import 'package:kids_math_homework/detail_screen/title/question_title.dart';
import 'package:kids_math_homework/main.dart';
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

  List<iLs> questions = [[], [], [], [], [], [], [], [], [], [], ];

  int answer = 0;

  int right = 0;
  int wrong = 0;

  String trueAndFalseAnswer = '';
  String totalAnswer = '';
  bool isTimer = true;
  List<bool> enableList = List.generate(10, (index) => true);

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

    if (questions.length == (right + wrong)) {
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
                  pageBuilder: (_, __, ___) => const ScreenOne()),
              ModalRoute.withName('/'));
          setState(() {
            isTimer = true;
          });
        },
      );

      //adding results to String
      totalAnswer += 'မှန်-$right + မှား-$wrong ။';

      Provider.of<MyProvider>(context, listen: false).answerSave1(totalAnswer);
      Provider.of<MyProvider>(context, listen: false).increment1();
      isTimer = !isTimer;
    }
  }

//question-> 10 items
  void generate() {
    List.generate(10, (index) => questions[index] = randomGenerateList(2));
  }

  @override
  void initState() {
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Screen One')),
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
                          Dialogs.showMyDialog(
                            text: Consumer<MyProvider>(
                                builder: (_, myProvider, child) {
                              return Text(totalResults(myProvider.answerString1)
                                  .toMM());
                            }),
                            parentContext: context,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (_, __, ___) =>
                                          const ScreenOne()),
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
                      Question2Row(no: i+1, child: GridView.builder(
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 50),
                    itemCount: questions[i].length,
                    itemBuilder: (context, index) {
                      return OutlinedButton(
                        onPressed: !enableList[i]
                            ? null
                            : () {
                                setState(() {
                                  enableList[i] = false;
                                  answer = questions[i][index];
                                  checkResult(questions[i][0], questions[i][1], answer);
                                });
                              },
                        child: Text(
                          questions[i][index].toString().toMM(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }),)
                  ],
                ),
              ),
            ),
          ],
        ));
  }

}
