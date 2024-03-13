  import 'package:kids_math_homework/my_widgets/mm_language_change.dart';

String totalResults(String string) {
    String str = '';
    List strList = string.split('။');
    for (int i = 0; i < strList.length; i++) {
      str += '${(i + 1).toString().toMM()}။ ${strList[i]} \n';
    }
    return str;
  }