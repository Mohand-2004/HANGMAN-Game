import 'package:flutter/material.dart';
import 'package:hang_man/core_controller.dart';
import 'package:hang_man/models/language_enum.dart';
import 'package:hang_man/models/letter_container_style.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/widgets/boarderd_container.dart';

// ignore: must_be_immutable
class WordContainer extends StatelessWidget{
  final double? width;
  final double? height;
  final double spaceBetweenLetters;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  LetterContainerStyle? letterContainerStyle;
  final TextStyle? textStyle;
  final Word word;
  WordContainer(
    {
      super.key,
      required this.word,
      this.width = double.infinity, 
      this.height = 100,
      this.backgroundColor = Colors.white,
      this.spaceBetweenLetters = 2,
      this.margin,
      this.letterContainerStyle,
      this.textStyle,
    }
  ){
    letterContainerStyle ??= LetterContainerStyle();
  }
  @override
  Widget build(BuildContext context) {
   return Container(
      width: width,
      height: height,
      margin: margin,
      color: backgroundColor,
      child: Row(
        children: (coreController.language == Language.english ? word.lettes : word.lettes.reversed).map((letter) => Expanded(
          child: BoarderdContainer(
            margin: EdgeInsets.symmetric(horizontal: spaceBetweenLetters),
            backgroundColor: letterContainerStyle!.backgroundColor,
            radius: letterContainerStyle!.radius,
            boarderColor: letterContainerStyle!.boarderColor,
            boarderWidth: letterContainerStyle!.boarderWidth,
            height: letterContainerStyle!.height,
            child: SizedBox(
              child: FittedBox(
                fit: BoxFit.contain,
                child: letter.appears ? Text(
                  '$letter',
                  style: textStyle,
                ) : Padding(
                  padding: const EdgeInsets.all(80),
                  child: Image.asset('assets/images/5726532.png'),
                )
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }
}