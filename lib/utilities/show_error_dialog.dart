import 'package:flutter/material.dart';

/* 
  Displays 'An error occured' along with text that was passed 
  through the parameter text to the screen. Also, has an OK button,
  when pressed it removes the screen. This function is called upon
  an error with signin or login.

  This the source that I used to implement this part
    - https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21
*/

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: const Text('An error occurred'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
