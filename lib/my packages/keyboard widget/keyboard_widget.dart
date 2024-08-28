import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/button.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';


class KeyboardWidget extends StatelessWidget{
  final double? width;
  final double? height;
  final double radius;
  final double boarderWidth;
  final EdgeInsetsGeometry? margin;
  final Color? boarderColor;
  final Color? backgroundColor;
  final ButtonsStyle? buttonsStyle;
  final void Function(String letter) submitCommand;
  final List<String> _letters1 = ['q','w','e','r','t','u','y','i','o','p'];
  final List<String> _letters2 = ['a','s','d','f','g','h','j','k','l'];
  final List<String> _letters3 = ['z','x','c','v','b','n','m'];
  KeyboardWidget(
    {
      super.key,
      required this.submitCommand,
      this.height = 200,
      this.width = double.infinity,
      this.backgroundColor = Colors.white,
      this.boarderColor = Colors.black,
      this.radius = 20,
      this.boarderWidth = 3,
      this.buttonsStyle,
      this.margin,
    }
  ){
    buttonsStyle ?? const ButtonStyle();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: margin,
      width: width,
      height: height,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: ((MediaQuery.of(context).size.width > 500) ? 25 : 30).h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: _letters1.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: buttonsStyle,
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(height: ((MediaQuery.of(context).size.width > 500) ? 5 : 10).h,),
              Expanded(
                child: Row(
                  children: <Widget>[SizedBox(width: 12.w,)] + _letters2.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: buttonsStyle,
                    ),
                  )).toList() + <Widget>[SizedBox(width: 12.w,)],
                ),
              ),
              SizedBox(height: ((MediaQuery.of(context).size.width > 500) ? 5 : 10).h,),
              Expanded(
                child: Row(
                  children: <Widget>[SizedBox(width: 33.w,)] + _letters3.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: buttonsStyle,
                    ),
                  )).toList() + <Widget>[SizedBox(width: 33.w,)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}