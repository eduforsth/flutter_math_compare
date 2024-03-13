import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';

class PuzzelBtn extends StatefulWidget {
  String text;
  Function() onPressed;
   PuzzelBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<PuzzelBtn> createState() => _PuzzelBtnState();
}

class _PuzzelBtnState extends State<PuzzelBtn> {
bool enable = true;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: !enable? null:
      (){
setState(() {
          enable = false;
        widget.onPressed();
});
      },
      style: OutlinedButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: Colors.grey.shade300,),
       child: Text(widget.text.toString().toMM(), style: const TextStyle(fontSize: 16),));
  }
}
