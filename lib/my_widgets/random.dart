import 'dart:math';
import 'package:kids_math_homework/main.dart';

int randomGenerate() {
  Random random = Random();
  int number = random.nextInt(90) + 10;
  return number;
}

iLs randomGenerateList(int count) {
  iLs list;
  list = List.generate(count, (index) => randomGenerate());
  // Set<int> set = list.toSet();
  Set<int> set = {...list};
  if (set.length < count) {
    while (set.length < count) {
     set.add(randomGenerate());
      }
    
  }
  return set.toList();
}
