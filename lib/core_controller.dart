import 'package:hang_man/models/word.dart';

class CoreController{
  late Word _word;
  CoreController(){
    String randomWord = "hello";
    _word = Word(randomWord);
  }

  bool guess(String letter){
    if(_word.guess(letter)){
      return true;
    }
    else{
      // pop states stack
      return false;
    }
  }

  Word get word => _word;
}
CoreController coreController = CoreController();