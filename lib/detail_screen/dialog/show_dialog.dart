import 'package:flutter/material.dart';

class Dialogs{
  static Future<void> showMyDialog({required parentContext, required Widget text, required Function onPressed}){
return showDialog(
      barrierDismissible: false,
      context: (parentContext),
      builder: (context) {
        return AlertDialog(
          title: const Text('ရလဒ်များ'),
          content: SingleChildScrollView(child: text),
          actions: [
            OutlinedButton(
                onPressed: () {
                  onPressed();
                },
                child: const Text('ပိတ်မည်')),
          ],
        );
      },
    );
  }
}