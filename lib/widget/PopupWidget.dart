import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  bool? _won;

  PopupWidget(this._won);

  @override
  Widget build(BuildContext context) {
    if (_won == false) {
      return AlertDialog(
        title: const Text(
          'Try again',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        content: const Text(
          'This grid is incorrect, try to find were you went wrong',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Ok'))
        ],
      );
    } else if (_won == true) {
      return AlertDialog(
        title: const Text(
          'Congratulations',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        content: const Text(
          "This grid is correct, you're awesome",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Ok'))
        ],
      );
    } else {
      return AlertDialog(
        title: const Text(
          'Error',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        content: const Text(
          'An unexpected error has occurred',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, 'cancel'),
              child: const Text('Ok'))
        ],
      );
    }
  }
}
