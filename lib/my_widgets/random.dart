import 'dart:math';

import 'package:kids_math_homework/main.dart';

int randomGenerate(){
  Random random = Random();
  int number = random.nextInt(90) + 10;
  return number;
}

iLs randomGenerateList(int count){
  iLs list ;
    Random random = Random();
    list = List.generate(count, (index) => randomGenerate()); 
    if(list.toSet().length != count){
      while(list.length != count){
        list.add(random.nextInt(100));
        list.toSet();
      }
    }
    return list;
}