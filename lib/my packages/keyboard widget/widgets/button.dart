import 'package:flutter/material.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';

class Button extends StatefulWidget{
  final String letter;
  final ButtonsStyle? style;
  final void Function(String letter) command;
  Button({super.key,required this.letter,required this.command,this.style}){
    style ?? ButtonsStyle();
  }
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button>{
  bool clicked = false;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () async {
        widget.command(widget.letter);
        setState((){
          clicked = !clicked;
        });
        await Future.delayed(const Duration(milliseconds: 200),(){
          setState((){
            clicked = !clicked;
          });
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.style!.spaceBetweenButtons),
        decoration: BoxDecoration(
          color: clicked ? widget.style!.buttonBoarderForegroundColor : widget.style!.buttonBoarderColor,
          borderRadius: BorderRadius.circular(widget.style!.buttonRadius),
        ),
        padding: EdgeInsets.all(widget.style!.buttonBoarderWidth),
        child: Container(
          decoration: BoxDecoration(
            color: clicked ? widget.style!.buttonForegroundColor : widget.style!.buttonBackgroundColor,
            borderRadius: BorderRadius.circular(widget.style!.buttonRadius-widget.style!.buttonBoarderWidth),
          ),
          child: Center(
            child: Text(
              widget.letter,
              style: widget.style!.textStyle,
            ),
          ),
        ),
      ),
    );
  }
}