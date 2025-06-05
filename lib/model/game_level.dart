class GameLevel {
  final int rows;
  final int columns;
  final String name;

  const GameLevel._(this.name, this.rows, this.columns);

  static const easy = GameLevel._("Easy", 2, 4);
  static const medium = GameLevel._("Medium", 3, 4);
  static const hard = GameLevel._("Hard", 4, 4);
}
