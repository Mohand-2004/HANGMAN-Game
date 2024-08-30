class RandomWord{
  late String _word;
  late String _hints;
  RandomWord({required String word,required String hints}){
    _word = word;
    _hints = hints;
  }
  String get word => _word;
  String get hints => _hints;
}