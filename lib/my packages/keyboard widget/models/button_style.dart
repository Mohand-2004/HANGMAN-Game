import 'package:flutter/material.dart';

class ButtonsStyle{
  final double buttonRadius;
  final double buttonBoarderWidth;
  final double spaceBetweenButtons;
  final Color? buttonBoarderColor;
  final Color? buttonBackgroundColor;
  final Color? buttonForegroundColor;
  final Color? buttonBoarderForegroundColor;
  TextStyle? textStyle;
  ButtonsStyle(
    {
      this.buttonRadius = 0,
      this.buttonBoarderWidth = 3,
      this.spaceBetweenButtons = 2,
      this.buttonBoarderColor = Colors.black,
      this.buttonBackgroundColor = Colors.white,
      this.buttonBoarderForegroundColor = Colors.cyan,
      this.buttonForegroundColor = Colors.grey,
      this.textStyle,
    }
  );
}