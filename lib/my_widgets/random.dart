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
  if (list.toSet().length < count) {
    int requiredNum = randomGenerate();
    for (int i = 0; i < count; i++) {
      if (!list.contains(requiredNum)) {
        if (list.length == count) {
          break;
        }
        list.add(requiredNum);
      }
    }
  }
  return list;
}
