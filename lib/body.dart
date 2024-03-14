import 'package:flutter/material.dart';
import 'package:kids_math_homework/detail_screen/screen_four.dart';
import 'package:kids_math_homework/detail_screen/screen_one.dart';
import 'package:kids_math_homework/detail_screen/screen_three.dart';
import 'package:kids_math_homework/detail_screen/screen_two.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding:  EdgeInsets.all(18.0),
            child: Text('Update Date - 14.03.24', style: TextStyle(fontSize: 18),),
          ),
          Expanded(
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5
            ),
                children: [
                  customContainer(num: 1, text: 'ကြီးသောကိန်း', press: const ScreenOne()),
                  customContainer(num: 2, text: 'ငယ်သောကိန်း', press: const ScreenTwo()),
                  customContainer(num: 3, text: 'ကြီးစဉ်ငယ်လိုက်', press: const ScreenThree()),
                  customContainer(num: 4, text: 'ငယ်စဉ်ကြီးလိုက်', press: const ScreenFour()),
                  
                ],
                ),
          ),
        ],
      )
    );
  }

  Widget customContainer({required int num, required String text, Widget? press}) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> press!)),
          child: Container(
            margin: const EdgeInsets.all(10),
                   decoration: BoxDecoration(
                    color: Colors.cyan,
                     borderRadius: num.isEven? const BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30)) : const BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                   ),
                   child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'pyidaungsu_bold'),),),
                ),
        );
      }
    );
  }
}