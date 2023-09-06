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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
        title: new Text("Hitori", style: TextStyle(fontSize: 30)),
          backgroundColor: const Color(0xFF03A9F4),
          leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, '/'),
          ),
      ),
      backgroundColor: Colors.white,
      body: Column(
            children: [
              Container(height: screenHeight * 0.07,),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.07,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  onPressed: () {
                    initGrid();
                  },
                  child: const Text(
                    'New grid',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.85,
                height: screenWidth * 0.85,
                child: GridWidget(
                    grid: grid,
                    onCellTapped: (row, col) {
                      setState(() {
                        final cell = grid.grid![row][col];
                        cell.blackened = !cell.blackened;
                      });
                    }),
              ),
              Container(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.07,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
