class Pair {
  final int _row;
  final int _col;

  Pair(this._row, this._col);

  int get row => _row;

  int get col => _col;

  @override
  bool operator ==(Object other) {
    if (other is Pair) {
      return _row == other.row && _col == other.col;
    }
    return false;
  }
}