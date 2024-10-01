import 'package:flutter/material.dart';
import 'package:tetris_game/screens/game_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _moveGameBoardScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            Text(
              't e t r i s  g a m e'.toUpperCase(),
              style: TextStyle(
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _moveGameBoardScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GameBoardScreen(),
      ),
    );
  }
}
