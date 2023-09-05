import 'package:compilation_et_dev_mobile/components/Cell.dart';

class Grid {
  List<List<Cell>> _grid;
  int _lenght = -1;
  bool _verified = false;

  Grid(this._grid, this._lenght, this._verified);

  List<List<Cell>> get grid => _grid;

  int get lenght => _lenght;

  bool get verified => _verified;

  set verified(bool value) {
    _verified = value;
  }
}
