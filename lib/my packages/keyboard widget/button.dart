import 'package:flutter/material.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';

class Button extends StatelessWidget{
  final String letter;
  final ButtonsStyle? style;
  Button({super.key,required this.letter,this.style}){
    style ?? ButtonsStyle();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: style!.spaceBetweenButtons),
      decoration: BoxDecoration(
        color: style!.buttonBoarderColor,
        borderRadius: BorderRadius.circular(style!.buttonRadius),
      ),
      padding: EdgeInsets.all(style!.buttonBoarderWidth),
      child: Container(
        decoration: BoxDecoration(
          color: style!.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(style!.buttonRadius-style!.buttonBoarderWidth),
        ),
        child: Center(
          child: Text(
            letter,
            style: style!.textStyle,
          ),
        ),
      ),
    );
  }
}