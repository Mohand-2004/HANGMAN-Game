import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final double radius;
  final double boarderWidth;
  final double fontSize;
  final Color? backgroundColor;
  final Color? boarderColor;
  final double space;
  const Button(
    {
      super.key,
      required this.radius,
      required this.boarderWidth,
      required this.fontSize,
      this.space = 0,
      this.backgroundColor,
      this.boarderColor,
    }
  );
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: space),
      decoration: BoxDecoration(
        color: boarderColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.all(boarderWidth),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius-boarderWidth),
        ),
      ),
    );
  }
}