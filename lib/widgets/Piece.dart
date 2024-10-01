import 'dart:ui';

import 'package:tetris_game/widgets/values.dart';

class Piece {
  Tetromino type;

  Piece({required this.type});

  List<int> position = [];

  Color get color {
    return tetrominoColors[type] ?? const Color(0xFFFFFFFF);
  }

  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        position = [-26, -16, -6, -5];
      case Tetromino.J:
        position = [-25, -15, -5, -6];
      case Tetromino.I:
        position = [-4, -5, -6, -7];
      case Tetromino.O:
        position = [-15, -16, -5, -6];
      case Tetromino.S:
        position = [-6, -5, -15, -14];
      case Tetromino.Z:
        position = [-5, -6, -16, -17];
      case Tetromino.T:
        position = [-6, -16, -15, -26];
        break;
      default:
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
        break;
        default:
    }
  }
}
