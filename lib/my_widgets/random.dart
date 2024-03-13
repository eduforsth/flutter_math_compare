import 'dart:math';

int randomGenerate(){
  Random random = Random();
  int number = random.nextInt(90) + 10;
  return number;
}

List<int> randomGenerateList(int count){
  List<int> list ;
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