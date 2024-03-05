// import 'package:flutter/material.dart';
// import 'package:kids_math_homework/main.dart';
// import 'package:kids_math_homework/my_widgets/mm_language_change.dart';

// Widget tweenTimer(int seconds){    
//   return Builder(
//      key: const ValueKey(1),
//     builder: (context) {
//       return TweenAnimationBuilder(
//                     tween: Tween(
//                       begin:  Duration(seconds: seconds),
//                       end: Duration.zero),
//                       onEnd: () {
//                         // Navigator.pop(context);

//       showDialog(
//         context: (context),
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('အချိန်စေ့ပါပြီ !'),
//             content: Text('ဆက်ကစားလိုပါသလား'),
//             actions: [
//               OutlinedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('ကစားမည်')),
//               OutlinedButton(
//                   onPressed: () {
                    
//                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const MyHome()),ModalRoute.withName('/'));
//                   },
//                   child: const Text('ထွက်မည်')),

//             ],
//           );
//         },
//       );

//                       },
//                      duration: Duration(seconds: seconds),
//                       builder: (context, duration, child){
//                         // final minutes = duration.inMinutes;
//                         final seconds = duration.inSeconds;
//                         return Text(languageChange('$seconds'));
//                       });
//     }
//   );
           
// }