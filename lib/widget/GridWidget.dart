import 'package:flutter/material.dart';
import 'package:compilation_et_dev_mobile/components/Grid.dart';
import 'package:compilation_et_dev_mobile/components/Cell.dart';

class GridWidget extends StatelessWidget {
  final Grid grid;

  GridWidget(this.grid);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: grid.length,
      ),
      itemCount: grid.length * grid.length,
      itemBuilder: (context, index) {
        final row = index ~/ grid.length;
        final col = index % grid.length;
        final cell = grid.grid![row][col];

        final borderColor = Colors.black;
        final borderWidth = 1.0;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
            color: borderColor,
            width: borderWidth,
            ),
              color: cell.blackened ? Colors.black : Colors.white
          ),
          child: Center(
            child: Text(
              cell.number != -1 ? cell.number.toString() : '',
              style: TextStyle(
                color: cell.blackened ? Colors.white : Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}