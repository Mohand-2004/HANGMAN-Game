import 'package:flutter/material.dart';

class BoarderdContainer extends StatelessWidget{
  final double? width;
  final double? height;
  final double radius;
  final double boarderWidth;
  final EdgeInsetsGeometry? margin;
  final Color? boarderColor;
  final Color? backgroundColor;
  final Widget? child;
  const BoarderdContainer(
    {
      super.key,
      this.width = double.infinity, 
      this.height = 100,
      this.radius = 0,
      this.boarderWidth = 3,
      this.boarderColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.margin,
      this.child,
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
        child: child,
      ),
    );
  }
}