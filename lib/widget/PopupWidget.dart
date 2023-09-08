import 'package:flutter/material.dart';

enum PopupType { gameRule, checkMessage }

class PopupWidget extends StatelessWidget {
  PopupType popupType;
  bool? _won;

  PopupWidget(this._won, {required this.popupType});

  PopupWidget.forRules({required this.popupType});

  @override
  Widget build(BuildContext context) {
    switch (popupType) {
      case PopupType.checkMessage:
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
      case PopupType.gameRule:
        return AlertDialog(
          title: const Text(
            'Game rules',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          content: const Text(
            "Hitori is played with a grid of squares or cells, with each cell initially containing a number. The game is played by eliminating squares/numbers and this is done by blacking them out. The objective is to transform the grid to a state wherein all three following rules are true : \n\n\n - No row or column can have more than one occurrence of any given number \n\n - Black cells cannot be horizontally or vertically adjacent, although they can be diagonal to one another \n\n - The remaining numbered cells must be all connected to each other, horizontally or vertically",
            style: TextStyle(fontSize: 14),
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
