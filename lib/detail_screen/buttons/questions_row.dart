import 'package:flutter/material.dart';
import 'package:kids_math_homework/my_widgets/mm_language_change.dart';

class QuestionsRow extends StatelessWidget {
  int no;
  Widget child;
   QuestionsRow({super.key, required this.no, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Column(
        children: [
          CircleAvatar(
            child: Text(no.toString().toMM()),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: child
          ),
        ],
      ),
    );
  }
}


