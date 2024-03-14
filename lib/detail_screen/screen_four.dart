import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_homework/controller.dart';
import 'package:kids_math_homework/detail_screen/buttons/questions_row.dart';
import 'package:kids_math_homework/detail_screen/dialog/show_dialog.dart';
import 'package:kids_math_homework/detail_screen/title/question_title.dart';
import 'package:kids_math_homework/detail_screen/buttons/puzzel_btn.dart';
import 'package:kids_math_homework/main.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/random.dart';
import 'package:kids_math_homework/my_widgets/total_results.dart';
import 'package:provider/provider.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {

  List<iLs> questions = [[], [], [], [], [], [], [], [], [], [], ];

  List<iLs> answers = [[], [], [], [], [], [], [], [], [], []];

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

//question-> 10 items
  void generate() {
    List.generate(10, (index) => questions[index] = randomGenerateList(5));
  }

  @override
  void initState() {
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Screen Four')),
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
                    text: 'ငယ်စဉ်ကြီးလိုက်စီပါ',
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
                              return Text(totalResults(myProvider.answerString4)
                                  .toMM());
                            }),
                            parentContext: context,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (_, __, ___) =>
                                          const ScreenFour()),
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
                            return myProvider.count4 == 0
                                ? const Text('')
                                : CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      // '${context.read<myController>().count}',
                                      '${myProvider.count4}',
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
                      // questionsRow(no: i + 1, question: questions[i], answer: answers[i])
                 QuestionsRow(no: i+1, child:  GridView.builder(
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: questions[i].length,
                itemBuilder: (context, index) {
                  return PuzzelBtn(
                    text: questions[i][index].toString(),
                    onPressed: () {
                      answers[i].add(questions[i][index]);
                      if (questions[i].length == answers[i].length) {
                        iLs ls = List.from(questions[i]);
                        ls.sort((a, b) => a.compareTo(b));
                        if (listEquals(ls, answers[i])) {
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
                                          const ScreenFour()),
                                  ModalRoute.withName('/'));
                              setState(() {
                                isTimer = true;
                              });
                            },
                          );

                          //adding results to String
                          totalAnswer += 'မှန်-$right + မှား-$wrong ။';

                          Provider.of<MyProvider>(context, listen: false)
                              .answerSave4(totalAnswer);
                          Provider.of<MyProvider>(context, listen: false)
                              .increment4();
                          isTimer = !isTimer;
                          // restart();
                        }
                      }
                    },
                  );
                }),)
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  // Widget questionsRow({
  //   required int no,
  //   required iLs question,
  //   required iLs answer,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     padding: const EdgeInsets.only(top: 3),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           child: Text(no.toString().toMM()),
  //         ),
  //         Container(
  //           height: 80,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.grey.shade200),
  //           child: GridView.builder(
  //               primary: false,
  //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount: 5, mainAxisSpacing: 5, crossAxisSpacing: 5),
  //               itemCount: question.length,
  //               itemBuilder: (context, index) {
  //                 return PuzzelBtn(
  //                   text: question[index].toString(),
  //                   onPressed: () {
  //                     answer.add(question[index]);
  //                     if (question.length == answer.length) {
  //                       iLs ls = List.from(question);
  //                       ls.sort((a, b) => a.compareTo(b));
  //                       if (listEquals(ls, answer)) {
  //                         increment();
  //                       } else {
  //                         decrement();
  //                       }

  //                       if (answers.length == (right + wrong)) {
  //                         Dialogs.showMyDialog(
  //                           text: Consumer<MyProvider>(
  //                               builder: (_, myProvider, child) {
  //                             return Text(
  //                                 '${totalResults(trueAndFalseAnswer)} \n မှန် ($right)ခု + မှား ($wrong)ခု = (${right + wrong}) ခု'
  //                                     .toMM());
  //                           }),
  //                           parentContext: context,
  //                           onPressed: () {
  //                             Navigator.pushAndRemoveUntil(
  //                                 context,
  //                                 PageRouteBuilder(
  //                                     transitionDuration: Duration.zero,
  //                                     pageBuilder: (_, __, ___) =>
  //                                         const ScreenFour()),
  //                                 ModalRoute.withName('/'));
  //                             setState(() {
  //                               isTimer = true;
  //                             });
  //                           },
  //                         );

  //                         //adding results to String
  //                         totalAnswer += 'မှန်-$right + မှား-$wrong ။';

  //                         Provider.of<MyProvider>(context, listen: false)
  //                             .answerSave4(totalAnswer);
  //                         Provider.of<MyProvider>(context, listen: false)
  //                             .increment4();
  //                         isTimer = !isTimer;
  //                         // restart();
  //                       }
  //                     }
  //                   },
  //                 );
  //               }),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}
