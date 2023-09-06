import 'package:flutter/material.dart';
import 'package:compilation_et_dev_mobile/components/Grid.dart';
import 'package:compilation_et_dev_mobile/components/Cell.dart';

class GridWidget extends StatelessWidget {
  final Grid grid;
  final Function(int row, int col) onCellTapped;

  GridWidget({required this.grid, required this.onCellTapped});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: grid.length,
      ),
      itemCount: grid.length * grid.length,
      itemBuilder: (context, index) {
        final row = index ~/ grid.length;
        final col = index % grid.length;
        final cell = grid.grid![row][col];

        return GestureDetector(
          onTap: () {
            onCellTapped(row, col); // Call the callback when tapped
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.1,
              ),
              color: cell.blackened ? Colors.black : Colors.white,
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
          ),
        );
      },
    );
  }
}