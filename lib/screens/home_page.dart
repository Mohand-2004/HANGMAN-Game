import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/keyboard_widget.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';
class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 22+4.h,bottom: 10,left: 5.w,right: 5.w),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // hangman image
            Container(
              width: 280.r,
              height: 280.r,
              color: Colors.amber,
            ),

            // space between
            SizedBox(height: 20.h,),

            // word widget
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              width: MediaQuery.of(context).size.width,
              height: 100.h,
              color: Colors.green,
            ),

            // space between
            SizedBox(height: 15.h,),

            // keyboard Widget
            KeyboardWidget(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              boarderWidth: 3.r,
              radius: 20.r,
              buttonsStyle: ButtonsStyle(
                buttonBackgroundColor: Colors.white,
                buttonBoarderColor: Colors.black,
                buttonBoarderForegroundColor: Colors.cyan,
                buttonRadius: 11.r,
                buttonBoarderWidth: 3.r,
                spaceBetweenButtons: 2.w,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: ((MediaQuery.of(context).size.width > 500) ? 25 : 20).r,
                  fontFamily: 'comic sans',
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}