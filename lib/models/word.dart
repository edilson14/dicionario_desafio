class Word {
  int id;
  String word;
  bool favorite;

  Word({
    required this.id,
    required this.word,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'favorite': favorite ? 1 : 0,
    };
  }

  factory Word.fromDataBase(Map word) {
    return Word(
      id: word['id'],
      word: word['word'],
      favorite: word['favorite'] == 1 ? true : false,
    );
  }
}
