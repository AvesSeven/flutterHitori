import 'dart:math';

import 'package:compilation_et_dev_mobile/components/Grid.dart';
import 'package:flutter/material.dart';

import '../components/Cell.dart';
import '../widget/GridWidget.dart';

class Game extends StatefulWidget {
  const Game({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late Grid grid;

  void initGrid() {
    final random = Random();
    final gridLength = 5;

    final gridData = List.generate(gridLength, (_) {
      return List.generate(gridLength, (_) {
        final randomNumber = random.nextInt(gridLength - 1) + 1;
        return Cell(false, randomNumber);
      });
    });

    grid = Grid(gridData, gridLength, false);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initGrid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/',
                  );
                },
                child: const Text(
                  'Return',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          )),
      backgroundColor: const Color(0xFF03A9F4),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 150.0,
                height: 75.0,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    initGrid();
                  },
                  child: const Text(
                    'New grid',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GridWidget(
                  grid: grid,
                  onCellTapped: (row, col) {
                    setState(() {
                      final cell = grid.grid![row][col];
                      cell.blackened = !cell.blackened;
                    });
                  }),
              const SizedBox(height: 25),
              SizedBox(
                width: 150.0,
                height: 75.0,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/game',
                    );
                  },
                  child: const Text(
                    'Check',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
