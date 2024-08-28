import 'package:flutter/material.dart';
import 'package:hang_man/models/word.dart';

class WordContainer extends StatelessWidget{
  final double? width;
  final double? height;
  final double radius;
  final double boarderWidth;
  final EdgeInsetsGeometry? margin;
  final Color? boarderColor;
  final Color? backgroundColor;
  final Word word;
  const WordContainer(
    {
      super.key,
      required this.word,
      this.width = double.infinity, 
      this.height = 100,
      this.radius = 0,
      this.boarderWidth = 3,
      this.boarderColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.margin,
    }
  );
  @override
  Widget build(BuildContext context) {
   return Container(
      width: width,
      height: height,
      margin: margin,
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
      )
    );
  }
}