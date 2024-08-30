import 'dart:math';
import 'package:hang_man/data%20structure/stack.dart';
import 'package:hang_man/models/arabic_words.dart';
import 'package:hang_man/models/language_enum.dart';
import 'package:hang_man/models/random_word.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/models/english_words.dart';

class CoreController{
  late Word _word;
  late Stack<String> _stagesStack;
  final Map<String,bool> _avalibaleLetters = {};
  Language language = Language.arabic;
  late RandomWord randomWord;
  CoreController(){
    _initWord();
    _initStack();
    _initLettersMap();
  }

  void _initLettersMap(){
    if(language == Language.english){
      for(int i = 97;i<=122;i++){
        _avalibaleLetters[String.fromCharCode(i)] = true;
      }
    }
    else{
      for(String letter in ['ض','ص','ث','ق','ف','غ','ع','ه','خ','ح','ج','ش','س','ي','ب','ل','ا','ت','ن','م','ك','ة','ظ','ط','ذ','د','ز','ر','و']){
        _avalibaleLetters[letter] = true;
      }
    }
  }

  void _initWord(){
    randomWord = language == Language.english ? easyEnglishWords[Random().nextInt(easyEnglishWords.length)] : easyArabicWords[Random().nextInt(easyArabicWords.length)];
    _word = Word(randomWord.word);
  }

  void _initStack(){
    _stagesStack = Stack();
    for(int i = 5;i>=1;i--){
      _stagesStack.push("assets/images/stage $i.png");
    }
  }

  void changeLanguage(){
    if(language == Language.arabic){
      language = Language.english;
    }
    else{
      language = Language.arabic;
    }
    resetGame();
  }

  bool? checkWinOrLose(){
    if(_word.isAllLettersAppear()){
      return true;
    }
    else if(_stagesStack.lenght() == 1){
      return false;
    }
    else{
      return null;
    }
  }

  bool guess(String letter){
    if(_word.guess(letter)){
      return true;
    }
    else{
      if(_stagesStack.lenght()!= 1){
        _stagesStack.pop();
      }
      _avalibaleLetters[letter] = false;
      return false;
    }
  }

  void resetGame(){
    _initWord();
    _initStack();
    _initLettersMap();
  }

  bool isLetterAvailable(String letter) => _avalibaleLetters[letter]!;

  Word get word => _word;
  String? get currentStage => _stagesStack.peek();
}
CoreController coreController = CoreController();