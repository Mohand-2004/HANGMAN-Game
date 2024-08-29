import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hang_man/models/letter_container_style.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/widgets/keyboard_widget.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';
import 'package:hang_man/core_controller.dart';
import 'package:hang_man/widgets/win_lable.dart';
import 'package:hang_man/widgets/word_container.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  bool? trueGuess;
  bool? win;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,55.h),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35,bottom: 5,left: 12.w),
                child: Text(
                  'HANGMAN GAME',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'impact',
                    fontSize: 30.sp,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 12.w,top: 37),
                child: ElevatedButton(
                  onPressed: (){
                    setState((){
                      coreController.resetGame();
                      win = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    fixedSize: Size(89.w,40.h-10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'comic sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      Icon(
                        Icons.restart_alt_rounded,
                        color: Colors.white,
                        size: 15.r,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12.h,bottom: 20,left: 5.w,right: 5.w),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // hangman image
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(coreController.currentStage!),
                      ),
                    ),
                  ),
                ),
          
                // space between
                SizedBox(height: 15.h,),
          
                // guess word text
                Row(
                  children: [
                    SizedBox(width: 18.w,),
                    Text(
                      'Guess The Word !!',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                        fontFamily: 'comic sans',
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
          
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
                SizedBox(height: 2.h,),
          
                // keyboard Widget
                KeyboardWidget(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  boarderWidth: 3.r,
                  radius: 20.r,
                  backgroundColor: const Color(0xffe0e2e4),
                  boarderColor: Colors.black,
                  buttonsStyle: ButtonsStyle(
                    buttonBackgroundColor: Colors.white,
                    buttonBoarderColor: Colors.grey,
                    buttonBoarderForegroundColor: Colors.cyan,
                    buttonForegroundColor: const Color.fromARGB(255, 233, 233, 233),
                    buttonRadius: 11.r,
                    buttonBoarderWidth: 2.r,
                    spaceBetweenButtons: 2.w,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: ((MediaQuery.of(context).size.width > 500) ? 25 : 20).r,
                      fontFamily: 'comic sans',
                    ),
                  ),
                  submitCommand: (letter) async {
                    setState((){
                      trueGuess = coreController.guess(letter);
                    });
                    await AudioPlayer().play(AssetSource('sounds/$trueGuess.mp3'));
                    await Future.delayed(const Duration(milliseconds: 500),(){
                      setState((){
                        trueGuess = null;
                      });
                    });
                    if(coreController.checkWinOrLose() != null){
                      await Future.delayed(const Duration(seconds: 1),(){
                        setState((){
                          win = coreController.checkWinOrLose();
                        });
                      });
                    }
                  },
                ),
              ],
            ),
          ),

          // true or false indicator
          trueGuess != null ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  trueGuess! ? const Color.fromARGB(255, 0, 255, 8) : const Color.fromARGB(255, 255, 17, 0),
                  for(int i = 0;i<50;i++)Colors.transparent,
                  trueGuess! ? const Color.fromARGB(255, 0, 255, 8) : const Color.fromARGB(255, 255, 17, 0),
                ],
              ),
            ),
          ) : const SizedBox(),

          // true or false indicator
          trueGuess != null ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  trueGuess! ? const Color.fromARGB(255, 0, 255, 8) : const Color.fromARGB(255, 255, 17, 0),
                  for(int i = 0;i<50;i++)Colors.transparent,
                  trueGuess! ? const Color.fromARGB(255, 0, 255, 8) : const Color.fromARGB(255, 255, 17, 0),
                ],
              ),
            ),
          ) : const SizedBox(),

          // win or lose widget
          win == null ? const SizedBox() : 
          (win! ? WinLable(
            winCommand: (){
              setState(() {
                coreController.resetGame();
                win = null;
              });
            },
          ) : Container(color: Colors.red,)),
        ],
      ),
    );
  }
}