import 'package:flutter/material.dart';

class LetterContainerStyle{
  final double radius;
  final double? height;
  final double? width;
  final double boarderWidth;
  final Color? backgroundColor;
  final Color? boarderColor;

  LetterContainerStyle(
    {
      this.backgroundColor = Colors.white, 
      this.boarderColor = Colors.black,
      this.radius = 20,
      this.boarderWidth = 3,
      this.height,
      this.width,
    }
  );
}