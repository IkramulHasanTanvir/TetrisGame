import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tetris_game/widgets/Piece.dart';
import 'package:tetris_game/widgets/control_button.dart';
import 'package:tetris_game/widgets/pixel.dart';
import 'package:tetris_game/widgets/values.dart';

List<List<Tetromino?>> gameBoard = List.generate(
  columnLength,
  (i) => List.generate(
    rowLength,
    (j) => null,
  ),
);

class GameBoardScreen extends StatefulWidget {
  const GameBoardScreen({super.key});

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  Piece currentPiece = Piece(type: Tetromino.L);

  @override
  void initState() {
    startGame();
    super.initState();
  }

  void startGame() {
    currentPiece.initializePiece();
    Duration frameRate = const Duration(milliseconds: 600);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      currentPiece.movePiece(Direction.down);
      checkLanding();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: columnLength * rowLength,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowLength),
                  itemBuilder: (context, index) {
                    int row = (index / rowLength).floor();
                    int column = (index % rowLength);
                    if (currentPiece.position.contains(index)) {
                      return Pixel(
                        color: currentPiece.color,
                        child: index.toString(),
                      );
                    } else if (gameBoard[row][column] != null) {
                      final Tetromino? tetrominoType = gameBoard[row][column];
                      return Pixel(
                          color: tetrominoColors[tetrominoType], child: '');
                    } else {
                      return Pixel(
                        color: Colors.grey.shade800,
                        child: index.toString(),
                      );
                    }
                  }),
            ),
            ControlButton(
                onTapMoveLeft: onTapMoveLeft,
                onTapRotate: () {},
                onTapMoveRight: onTapMoveRight),
          ],
        ),
      ),
    );
  }

  bool checkCollision(Direction direction) {
    for (int i = 0; i < currentPiece.position.length; i++) {
      int row = (currentPiece.position[i] / rowLength).floor();
      int column = currentPiece.position[i] % rowLength;

      if (direction == Direction.left) {
        column -= 1;
      } else if (direction == Direction.right) {
        column += 1;
      } else if (direction == Direction.down) {
        row += 1;
      }
      if (row >= columnLength || column < 0 || column >= rowLength) {
        return true;
      }
    }
    return false;
  }

  void checkLanding() {
    if (checkCollision(Direction.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLength).floor();
        int column = currentPiece.position[i] % rowLength;

        if (row >= 0 && column >= 0) {
          gameBoard[row][column] = currentPiece.type;
        }
      }
      createNewPiece();
    }
  }

  void createNewPiece() {
    Random random = Random();
    Tetromino randomType =
        Tetromino.values[random.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();
  }

  void onTapMoveLeft() {
    if (!checkCollision(Direction.left)) {
      currentPiece.movePiece(Direction.left);
      setState(() {});
    }
  }

  void onTapMoveRight() {
    if (!checkCollision(Direction.right)) {
      currentPiece.movePiece(Direction.right);
      setState(() {});
    }
  }
}
