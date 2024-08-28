class Letter{
  late final String _text;
  late bool appears;
  Letter({required String text,this.appears = false}){
    _text = text;
  }
  @override
  String toString(){
    return text;
  }
  String get text => _text;
}