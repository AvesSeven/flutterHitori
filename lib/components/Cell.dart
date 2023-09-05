class Cell {
  bool _blackened = false;
  int _number = -1;

  Cell(this._blackened, this._number);

  bool get blackened => _blackened;

  set blackened(bool value) {
    _blackened = value;
  }

  int get number => _number;
}