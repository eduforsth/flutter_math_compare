import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';
import 'package:kids_math_homework/my_widgets/timer.dart';
import 'package:kids_math_homework/random.dart';

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

  List<int> selectedList01 = [];
  List<int> selectedList02 = [];
  List<int> selectedList03 = [];
  List<int> selectedList04 = [];
  List<int> selectedList05 = [];
  List<int> selectedList06 = [];
  List<int> selectedList07 = [];
  List<int> selectedList08 = [];
  List<int> selectedList09 = [];
  List<int> selectedList10 = [];

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
 bool isTimer = true;

   int count = 0;
  List<String> results = [];

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
      // isTimer = !isTimer;
      selectedList01.clear();
      selectedList02.clear();
      selectedList03.clear();
      selectedList04.clear();
      selectedList05.clear();
      selectedList06.clear();
      selectedList07.clear();
      selectedList08.clear();
      selectedList09.clear();
      selectedList10.clear();
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


  List<int> sortBigToSmall(List<int> ls) {
    var q = (ls..sort()).reversed.toList();
    return q;
  }

  //     List sortSmallToBig(List<int> ls) {
  //   var q = (ls..sort());
  //   return q;
  // }

  void compare(List<int> ls, List<int> selectedLists) {
    if (selectedLists.length == 5) {
      if (sortBigToSmall(ls).toString() == selectedLists.toString()) {
        right++;
      } else {
        wrong++;
      }

        // selectedList01.clear();
        resultTotalDialog();
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

  void resultTotalDialog(){
                         if (right + wrong == 10) {
                          count++;
                          isTimer = !isTimer;  
                          results.add(languageChange('မှန် = ($right) ခု + မှား = ($wrong) ခု'));
                          showDialog(
                            barrierDismissible: false,
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
                                        setState(() {
                                          isTimer = !isTimer;
                                          restart();
                                        });
                                      },
                                      child: const Text('ပိတ်မည်'))
                                ],
                              );
                            },
                          );
                          // restart();
                        }   
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
        title: const Text('Screen Three'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(child: Text('ကြီးစဉ်ငယ်လိုက်စီပါ')),
              CircleAvatar(child: isTimer? tweenTimer(30, 1, minutes: 1) : const Text('?'), radius: 30,)


            ],
          ),
        ),
        //  Text(sortBigToSmall().toString()),
        //  Text(selectedList01.toString()),
        // Text(sortBigToSmall().reversed.toString()),
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
              answerRow(no: 1, num: selectedList01.length == 5? sortBigToSmall(q1): q1, check: isAnswer1, selectedList: selectedList01),
              answerRow(no: 2, num: selectedList02.length == 5? sortBigToSmall(q2): q2, check: isAnswer2, selectedList: selectedList02),
              answerRow(no: 3, num: selectedList03.length == 5? sortBigToSmall(q3): q3, check: isAnswer3, selectedList: selectedList03),
              answerRow(no: 4, num: selectedList04.length == 5? sortBigToSmall(q4): q4, check: isAnswer4, selectedList: selectedList04),
              answerRow(no: 5, num: selectedList05.length == 5? sortBigToSmall(q5): q5, check: isAnswer5, selectedList: selectedList05),
              answerRow(no: 6, num: selectedList06.length == 5? sortBigToSmall(q6): q6, check: isAnswer6, selectedList: selectedList06),
              answerRow(no: 7, num: selectedList07.length == 5? sortBigToSmall(q7): q7, check: isAnswer7, selectedList: selectedList07),
              answerRow(no: 8, num: selectedList08.length == 5? sortBigToSmall(q8): q8, check: isAnswer8, selectedList: selectedList08),
              answerRow(no: 9, num: selectedList09.length == 5? sortBigToSmall(q9): q9, check: isAnswer9, selectedList: selectedList09),
              answerRow(no: 10, num: selectedList10.length == 5? sortBigToSmall(q10): q10, check: isAnswer10, selectedList: selectedList10),
            ],
          ),
        )
      ]),
    );
  }

  Widget answerRow(
      {required int no, required List<int> num, required List<bool> check, required List<int> selectedList}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400, width: 2), borderRadius: no.isEven? const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)) : const BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Column(
        children: [
          CircleAvatar(
            child: Text(languageChange(no.toString())),
          ),
          selectedList.length != 5? const Text('') : Text('အဖြေ', style: TextStyle(color: Colors.green.shade400),),
          // Text(num.toString()),
          // isShow[no - 1]? Text(languageChange(sortBigToSmall(num).toString())) : const Text(''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: check[0]
                    ? null
                    : () {
                        setState(() {
                          // print(num.toList());

                          checkRow(no-1, 0);
                          selectedList.add(num[0]);
                          compare(num, selectedList);
                          // print(num.toList());
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
                          // print(num.toList());

                          checkRow(no-1, 1);
                          selectedList.add(num[1]);
                          compare(num, selectedList);
                          // print(num.toList());

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
                          // print(num.toList());

                          checkRow(no-1, 2);
    
                          selectedList.add(num[2]);
                          compare(num, selectedList);
                          // print(num.toList());

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
                          // print(num.toList());

                          checkRow(no-1, 3);
    
                          selectedList.add(num[3]);
                          compare(num, selectedList);
                          // print(num.toList());

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
                          // print(num.toList());

                          checkRow(no-1, 4);
    
                          selectedList.add(num[4]);
                          compare(num, selectedList);
                          // print(num.toList());

                        });
                      },
                child: Text(languageChange('${num[4]}')),
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
              ),
            ],
          ),
          selectedList.isEmpty? const Text('') : Text(languageChange('ရွေးချယ်ထားသော ဂဏန်းများ(${selectedList.toString()})'), style: TextStyle(color: Colors.green.shade400),),
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
                },
                child: const Text('ပိတ်မည်'))
          ],
        );
      },
    );
  }

}
