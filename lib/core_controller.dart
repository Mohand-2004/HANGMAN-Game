import 'package:hang_man/data%20structure/stack.dart';
import 'package:hang_man/models/word.dart';

class CoreController{
  late Word _word;
  late Stack<String> _stagesStack;
  CoreController(){
    String randomWord = "hello";
    _word = Word(randomWord);
    _initStack();
  }

  void _initStack(){
    _stagesStack = Stack();
    for(int i = 5;i>=1;i--){
      _stagesStack.push("assets/images/stage $i.png");
    }
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
      return false;
    }
  }

  void resetGame(){
    // choose another word
    String randomWord = "hello";
    _word = Word(randomWord);
    _initStack();
  }

  Word get word => _word;
  String? get currentStage => _stagesStack.peek();
}
CoreController coreController = CoreController();