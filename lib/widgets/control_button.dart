import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.onTapMoveLeft,
    required this.onTapRotate,
    required this.onTapMoveRight,
  });

  final VoidCallback onTapMoveLeft;
  final VoidCallback onTapRotate;
  final VoidCallback onTapMoveRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: onTapMoveLeft,
            icon: Icon(
              Icons.arrow_back_ios,
              size: 44,
              color: Colors.grey.shade600,
            ),
          ),
          IconButton(
            onPressed: onTapRotate,
            icon: Icon(
              Icons.replay_outlined,
              size: 44,
              color: Colors.grey.shade600,
            ),
          ),
          IconButton(
            onPressed: onTapMoveRight,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 44,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
