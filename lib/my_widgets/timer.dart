import 'package:flutter/material.dart';
import 'package:kids_math_homework/main.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';

Widget tweenTimer({required int seconds,int? minutes}){    
  return Builder(
    //  key: ValueKey(key),
    builder: (context) {
      return TweenAnimationBuilder(
                    tween: Tween(
                      begin:  Duration(minutes: minutes?? 0, seconds: seconds),
                      end: Duration.zero),
                      onEnd: () {
                        // Navigator.pop(context);

      showDialog(
        barrierDismissible: false,
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: const Text('အချိန်စေ့ပါပြီ !'),
            content: const Text('ဆက်ကစားလိုပါသလား'),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    
                  },
                  child: const Text('ကစားမည်')),
              OutlinedButton(
                  onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const MyHome()),ModalRoute.withName('/'));
                  },
                  child: const Text('ထွက်မည်')),
            ],
          );
        },
      );
                      },
                     duration: Duration(minutes: minutes?? 0, seconds: seconds),
                      builder: (context, duration, child){
                         final minutes = duration.inMinutes;
                        final seconds = duration.inSeconds % 60;
                        return seconds ==0? const Text('') : Text(languageChange('${minutes == 0?'': "$minutes : "}$seconds'));
                      });
    }
  );
           
}
