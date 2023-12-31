import 'dart:math';

import 'package:compilation_et_dev_mobile/mockedData/GridsList.dart';
import 'package:compilation_et_dev_mobile/Utils/Pair.dart';
import 'package:compilation_et_dev_mobile/components/Grid.dart';
import 'package:compilation_et_dev_mobile/widget/PopupWidget.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../components/Cell.dart';
import '../widget/GridWidget.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(mode: StopWatchMode.countUp);
  late Grid grid;
  static List<Pair> visited = [];

  void initGrid() {
    GridsList gridsList = GridsList();
    final gridLength = 5;
    final random = Random();

    final randomGrid = random.nextInt(gridsList.grids.length);

    // Instancie une grille avec une valeur aberrante
    final gridData = List.generate(gridLength, (_) {
      return List.generate(gridLength, (_) {
        return Cell(false, -1);
      });
    });

    // Utilise la grille récupérer dans GridsList pour générer une grille résolvable
    for (int i = 0; i < gridLength; i++) {
      for (int j = 0; j < gridLength; j++) {
        gridData[i][j] = Cell(false, gridsList.grids[randomGrid][i][j]);
      }
    }

    grid = Grid(gridData, gridLength, false);
    setState(() {});
  }

  // Permet de dire si le joueur a gagné ou non
  bool checkGrid() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid.length; j++) {
        if (grid.grid![i][j].blackened) {
          if (hasBlackenedCellAround(i, j)) {
            return false;
          }
        } else {
          int cellNumber = grid.grid![i][j].number;
          if (hasSiblingsOnSameAxes(i, j, cellNumber)) {
            return false;
          }
        }
      }
    }
    return isRelated();
  }

  // Regarde s'il y a d'autre case noire autour d'une case en particulier
  bool hasBlackenedCellAround(int i, int j) {
    bool cellBlackenedUp = (i - 1 >= 0) && grid.grid![i - 1][j].blackened;
    bool cellBlackenedDown =
        (i + 1 < grid.length) && grid.grid![i + 1][j].blackened;
    bool cellBlackenedRight = (j - 1 >= 0) && grid.grid![i][j - 1].blackened;
    bool cellBlackenedLeft =
        (j + 1 < grid.length) && grid.grid![i][j + 1].blackened;

    return cellBlackenedUp ||
        cellBlackenedDown ||
        cellBlackenedRight ||
        cellBlackenedLeft;
  }

  // Regarde s'il y a le numéro d'une case particulière sur la même ligne ou la même colonne
  bool hasSiblingsOnSameAxes(int i, int j, int number) {
    for (int k = 0; k < grid.length; k++) {
      if ((k != i) &&
          !(grid.grid![k][j].blackened) &&
          (grid.grid![k][j].number == number)) {
        return true;
      }
    }

    for (int k = 0; k < grid.length; k++) {
      if ((k != j) &&
          !(grid.grid![i][k].blackened) &&
          (grid.grid![i][k].number == number)) {
        return true;
      }
    }

    return false;
  }

  // Compte le nombre de cellules connectées (en récursif)
  static int nbOfConnexeCells(Grid grid, int i, int j) {
    if ((i < 0) ||
        (i >= grid.length) ||
        (j < 0) ||
        (j >= grid.length) ||
        (grid.grid![i][j].blackened) ||
        visited.contains(Pair(i, j))) {
      return 0;
    } else {
      visited.add(Pair(i, j));
      return 1 +
          nbOfConnexeCells(grid, i - 1, j) +
          nbOfConnexeCells(grid, i, j + 1) +
          nbOfConnexeCells(grid, i + 1, j) +
          nbOfConnexeCells(grid, i, j - 1);
    }
  }

  // Compte le nombre de cellules noires
  int nbOfBlackenedCells() {
    int nbCells = 0;
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid.length; j++) {
        if (grid.grid![i][j].blackened) {
          nbCells++;
        }
      }
    }
    return nbCells;
  }

  // Permet de s'assurer qu'il n'y a qu'un seul "groupe" de cases blanches
  bool isRelated() {
    visited = [];
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid.length; j++) {
        if (!(grid.grid![i][j].blackened)) {
          // Pour s'assurer qu'il n'y ait qu'un seul groupe,
          // on additionne le nombre de cellules noires avec le nombre de cellules blanches connexes
          return (nbOfConnexeCells(grid, i, j) + nbOfBlackenedCells()) ==
              (grid.length * grid.length);
        }
      }
    }
    return false;
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  void resetTimer() {
    this._stopWatchTimer.onStopTimer();
    this._stopWatchTimer.onResetTimer();
    this._stopWatchTimer.onStartTimer();
  }

  void stopTimer() {
    this._stopWatchTimer.onStopTimer();
  }

  void startTimer() {
    this._stopWatchTimer.onStartTimer();
  }

  @override
  void initState() {
    super.initState();
    initGrid();
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    this._stopWatchTimer.onStartTimer();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: new Text("Hitori", style: TextStyle(fontSize: 30)),
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          actions: [
            Container(
                width: screenWidth * 0.13,
                height: screenHeight * 0.13,
                child: IconButton(
                  icon: Icon(Icons.question_mark),
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PopupWidget.rules(popupType: PopupType.gameRule);
                      },
                    );
                  },
                )),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.05,
              ),
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: StreamBuilder<int>(
                  stream: _stopWatchTimer.secondTime,
                  initialData: 0,
                  builder: (context, snap) {
                    final value = snap.data;
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: screenHeight * 0.05,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                        resetTimer();
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
                  Container(width: screenWidth * 0.1),
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
                        stopTimer();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return PopupWidget.gameCheckWithAction(checkGrid(),
                                () {
                              startTimer();
                              if (checkGrid() == true) {
                                initGrid();
                                resetTimer();
                              }
                            }, popupType: PopupType.checkMessage);
                          },
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
              Container(
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ));
  }
}
