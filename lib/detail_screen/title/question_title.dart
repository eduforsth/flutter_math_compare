import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/timer.dart';

class QuestionTitle extends StatelessWidget {
   QuestionTitle({
    super.key,
    required this.text,
    required this.isTimer,
     this.minutes,
  });

String text;
 bool isTimer;
int? minutes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text),
       CircleAvatar(
          radius: 30,
          child: isTimer? tweenTimer(seconds: 30, minutes: minutes)   
          : const Text('?')
        ),
      ],
    );
  }
}
