import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoseLable extends StatelessWidget{
  final void Function() loseCommand;
  final String correctWord;
  const LoseLable({super.key,required this.loseCommand,required this.correctWord});
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(179, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            width: 300.r,
            height: 300.r,
            image: const AssetImage('assets/images/gameover image.png')
          ),
          SizedBox(height: 8.h,),
          Text(
            'You Lose !',
            style: TextStyle(
              fontFamily: 'Monotype Corsiva',
              fontSize: 45.sp,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          Text(
            '($correctWord)',
            style: TextStyle(
              fontSize: 30.sp,
              color: const Color.fromARGB(255, 0, 183, 6),
              fontFamily: 'comic sans',
            ),
          ),
          SizedBox(height: 16.h,),
          GestureDetector(
            onTap: loseCommand,
            child: Container(
              width: 280.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                children: [
                  const Spacer(flex: 55,),
                  Text(
                    'play again',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontFamily: 'Berlin Sans FB Demi',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Icon(
                    Icons.restart_alt_rounded,
                    color: Colors.white,
                    size: 30.r,
                  ),
                  const Spacer(flex: 45,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}