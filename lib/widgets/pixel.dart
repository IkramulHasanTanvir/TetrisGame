import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  const Pixel({super.key, required this.color, this.child});

  final Color color;
  final int? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          child.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
