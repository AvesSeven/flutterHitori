import 'package:compilation_et_dev_mobile/components/Cell.dart';

class Grid {
  List<List<Cell>>? _grid;
  int _length = -1;
  bool _verified = false;

  Grid(this._grid, this._length, this._verified);

  List<List<Cell>>? get grid => _grid;

  int get length => _length;

  bool get verified => _verified;

  set verified(bool value) {
    _verified = value;
  }
}
