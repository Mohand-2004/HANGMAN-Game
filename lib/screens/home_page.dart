import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hang_man/models/language_enum.dart';
import 'package:hang_man/models/letter_container_style.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/widgets/keyboard_widget.dart';
import 'package:hang_man/my%20packages/keyboard%20widget/models/button_style.dart';
import 'package:hang_man/core_controller.dart';
import 'package:hang_man/widgets/lose_label.dart';
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
  bool showHintAlert = false;
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
                padding: const EdgeInsets.only(top: 35),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      coreController.changeLanguage();
                    });
                  },
                  icon: Icon(
                    Icons.language_outlined,
                    size: 22.r,
                  ),
                ),
              ),
              SizedBox(width: (MediaQuery.of(context).size.width > 500 ? 5.w : 0),),
              Padding(
                padding: EdgeInsets.only(right: 12.w,top: 37),
                child: ElevatedButton(
                  onPressed: (){
                    setState((){
                      coreController.resetGame();
                      win = null;
                      showHintAlert = false;
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
                      coreController.language == Language.english ? Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'comic sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ) : Icon(
                        Icons.restart_alt_rounded,
                        color: Colors.white,
                        size: 15.r,
                      ),
                      SizedBox(width: 3.w,),
                      coreController.language == Language.english ? Icon(
                        Icons.restart_alt_rounded,
                        color: Colors.white,
                        size: 15.r,
                      ) : Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'إعادة',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'comic sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
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
          GestureDetector(
            onTap: () {
              setState(() {
                showHintAlert = false;
              });
            },
            child: Container(
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
                    children: coreController.language == Language.english ? [
                      SizedBox(width: 18.w,),
                      Text(
                        'Guess The Word !!',
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'comic sans',
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.5.h),
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              showHintAlert = !showHintAlert;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffe0e2e4),
                            radius: 15.r,
                            child: Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: Image.asset('assets/images/hint.png'),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ] : [
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.5.h),
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              showHintAlert = !showHintAlert;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffe0e2e4),
                            radius: 13.5.r,
                            child: Image.asset('assets/images/hint.png'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text(
                        '!! خمن ما هي الكلمة',
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black,
                          fontFamily: 'comic sans',
                        ),
                      ),
                      SizedBox(width: 18.w,),
                    ]
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
                        fontSize: ((MediaQuery.of(context).size.width > 500) ? (coreController.language == Language.arabic ? 21 : 25) : (coreController.language == Language.arabic ? 16 : 20)).r,
                        fontFamily: 'comic sans',
                      ),
                    ),
                    submitCommand: (letter) async {
                      if(coreController.isLetterAvailable(letter)){
                        setState((){
                          trueGuess = coreController.guess(letter);
                          showHintAlert = false;
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
                      }
                    },
                  ),
                ],
              ),
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
                showHintAlert = false;
              });
            },
          ) : LoseLable(
            correctWord: coreController.randomWord.word,
              loseCommand: (){
                setState((){
                coreController.resetGame();
                  win = null;
                  showHintAlert = false;
                });
              }
            )
          ),

          // hints alert
          showHintAlert ? Positioned(
            left: 50.w,
            top: (MediaQuery.of(context).size.width < 400 ? 290 : 310).h,
            child: coreController.language == Language.arabic ? Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 25.w),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/hint arabic container.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  coreController.wordHint,
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ) : Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 25.w),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/hint english container.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  coreController.wordHint,
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}