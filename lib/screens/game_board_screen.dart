import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris_game/widgets/Piece.dart';
import 'package:tetris_game/widgets/control_button.dart';
import 'package:tetris_game/widgets/pixel.dart';
import 'package:tetris_game/widgets/values.dart';

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
                    if (currentPiece.position.contains(index)) {
                      return Pixel(
                        color: Colors.amber,
                        child: index,
                      );
                    } else {
                      return Pixel(
                        color: Colors.grey.shade800,
                        child: index,
                      );
                    }
                  }),
            ),
            ControlButton(
              onTapMoveLeft: () {},
              onTapRotate: () {},
              onTapMoveRight: () {},
            ),
          ],
        ),
      ),
    );
  }
}
