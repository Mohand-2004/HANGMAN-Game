import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hang_man/models/letter_container_style.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/widgets/keyboard_widget.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';
import 'package:hang_man/core_controller.dart';
import 'package:hang_man/widgets/word_container.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
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
            WordContainer(
              word: coreController.word,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              width: MediaQuery.of(context).size.width,
              height: 100.h,
              backgroundColor: Colors.white,
              spaceBetweenLetters: 3.w,
              letterContainerStyle: LetterContainerStyle(
                height: 68.r,
                boarderColor: Colors.grey,
                boarderWidth: 3.r,
              ),
              textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'comic sans',
              ),
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
              backgroundColor: Colors.white,
              boarderColor: Colors.grey,
              buttonsStyle: ButtonsStyle(
                buttonBackgroundColor: Colors.white,
                buttonBoarderColor: Colors.grey,
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
              submitCommand: (letter){
                setState(() {
                  coreController.guess(letter);
                });
              },
            ),
          ],
        )
      ),
    );
  }
}