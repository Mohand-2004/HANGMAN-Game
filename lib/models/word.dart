import 'package:hang_man/models/letter.dart';

class Word{
  final List<Letter> _letters = [];
  final Map<String,num?> _counter = {};
  Word(String text){
    for(int i = 0;i<text.length;i++){
      _letters.add(Letter(text: text[i]));
      if(_counter[text[i]] == null){
        _counter[text[i]] = 1;
      }
      else{
        _counter[text[i]] = _counter[text[i]] !+ 1;
      }
    }
  }

  bool guess(String gussedLetter){
    if(_counter[gussedLetter] == null || _counter[gussedLetter] == 0){
      if(_counter[gussedLetter] != null){
        _counter[gussedLetter] =-_counter[gussedLetter] !- 1;
      }
      return false;
    }
    else{
      for (Letter letter in _letters) {
        if(gussedLetter == "$letter" && !letter.appears){
          letter.appears = true;
          return true;
        }
      }
      return false;
    }
  }
}