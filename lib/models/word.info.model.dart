class WordInfoModel {
  String word;
  int id;

  WordInfoModel({
    required this.word,
    required this.id,
  });
}

class Meaning {
  String partOfSpeech;
  List<Definitions> definitions = [];

  Meaning({required this.partOfSpeech});
}

class Definitions {}

class Phonetics {
  String? audio;
}
