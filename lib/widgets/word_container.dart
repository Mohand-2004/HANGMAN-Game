import 'package:flutter/material.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/widgets/boarderd_container.dart';

class WordContainer extends StatelessWidget{
  final double? width;
  final double? height;
  final double spaceBetweenLetters;
  // final double radius;
  //final double boarderWidth;
  final EdgeInsetsGeometry? margin;
  //final Color? boarderColor;
  final Color? backgroundColor;
  final Word word;
  const WordContainer(
    {
      super.key,
      required this.word,
      this.width = double.infinity, 
      this.height = 100,
      //this.radius = 0,
      //this.boarderWidth = 3,
      //this.boarderColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.spaceBetweenLetters = 2,
      this.margin,
    }
  );
  @override
  Widget build(BuildContext context) {
   return Container(
      width: width,
      height: height,
      margin: margin,
      color: Colors.red,
      child: Row(
        children: word.lettes.map((letter) => Expanded(
          child: BoarderdContainer(
            margin: EdgeInsets.symmetric(horizontal: spaceBetweenLetters),
            backgroundColor: Colors.white,
            radius: 20,
            boarderColor: Colors.black,
            boarderWidth: 3,
            child: SizedBox(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(letter.appears ? '$letter' : '?'),
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }
}