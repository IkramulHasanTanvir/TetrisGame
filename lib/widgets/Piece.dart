import 'package:tetris_game/widgets/values.dart';

class Piece {
  Tetromino type;

  Piece({required this.type});

  List<int> position = [];

  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        position = [
          4,
          14,
          24,
          25,
        ];
        break;
      default:
      /*case Tetromino.J:
      // TODO: Handle this case.
      case Tetromino.I:
      // TODO: Handle this case.
      case Tetromino.O:
      // TODO: Handle this case.
      case Tetromino.S:
      // TODO: Handle this case.
      case Tetromino.Z:
      // TODO: Handle this case.
      case Tetromino.T:
      // TODO: Handle this case.*/
    }
  }

  void movePiece(Direction direction) {
    switch (direction) {
      case Direction.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
      case Direction.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLength;
        }
    }
  }
}
