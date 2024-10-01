import 'package:flutter/material.dart';

int rowLength = 10;
int columnLength = 15;

enum Direction {
  left,
  right,
  down,
}

enum Tetromino {
  L,
  J,
  I,
  O,
  S,
  Z,
  T,
}

/*

o
o
o o

  o
  o
o o

o
o
o
o

o o
o o

  o o
o o

o o
  o o

  o
  o o
  o

*/

const Map<Tetromino, Color> tetrominoColors = {
  Tetromino.L: Colors.amber,
  Tetromino.J: Colors.red,
  Tetromino.I: Colors.blue,
  Tetromino.O: Colors.pink,
  Tetromino.S: Colors.green,
  Tetromino.Z: Colors.deepPurple,
  Tetromino.T: Colors.lightGreenAccent,
};
