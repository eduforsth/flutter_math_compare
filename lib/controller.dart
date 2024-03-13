import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier{

  int _count1 =0;
  int _count2 =0;
  int _count3 =0;
  int _count4 =0;
   String _string1 = '';
   String _string2 = '';
   String _string3 = '';
   String _string4 = '';


  int get count1 => _count1;
  int get count2 => _count2;
  int get count3 => _count3;
  int get count4 => _count4;
  String get answerString1 => _string1;
  String get answerString2 => _string2;
  String get answerString3 => _string3;
  String get answerString4 => _string4;

  void increment1(){
   _count1++;
   notifyListeners();
  }
  void increment2(){
   _count2++;
   notifyListeners();
  }
  void increment3(){
   _count3++;
   notifyListeners();
  }
  void increment4(){
   _count4++;
   notifyListeners();
  }

  void answerSave1(String string){
    _string1 += string;
    notifyListeners();
  }

  void answerSave2(String string){
    _string2 += string;
    notifyListeners();
  }

  void answerSave3(String string){
    _string3 += string;
    notifyListeners();
  }

  void answerSave4(String string){
    _string4 += string;
    notifyListeners();
  }

}