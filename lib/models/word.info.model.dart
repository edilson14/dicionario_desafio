import 'package:get/get.dart';

class WordInfoModel {
  String word;
  String? phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  String? audioUrl;

  WordInfoModel({
    required this.word,
    this.phonetic,
    required this.phonetics,
    required this.meanings,
    this.audioUrl,
  });

  factory WordInfoModel.fromJson(Map<String, dynamic> json) {
    List<Phonetic> pheonethics = json['phonetics']
            .map<Phonetic>((pheonetic) => Phonetic.fromJson(pheonetic))
            .toList() ??
        [];

    return WordInfoModel(
      word: json['word'],
      audioUrl: pheonethics
          .firstWhereOrNull(
            (element) => element.audio.isNotEmpty,
          )
          ?.audio,
      phonetic: json['phonetic'].toString().replaceAll('/', ''),
      phonetics: pheonethics,
      meanings: json['meanings']
              .map<Meaning>((def) => Meaning.fromJson(def))
              .toList() ??
          [],
    );
  }
}

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;
  List<dynamic> synonyms;
  List<dynamic> antonyms;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      partOfSpeech: json['partOfSpeech'],
      definitions: json['definitions']
              .map<Definition>((def) => Definition.fromJson(def))
              .toList() ??
          [],
      synonyms: json['synonyms'],
      antonyms: json['antonyms'],
    );
  }
}

class Definition {
  String definition;
  List<dynamic> synonyms;
  List<dynamic> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'],
      synonyms: json['synonyms'],
      antonyms: json['antonyms'],
    );
  }
}

class Phonetic {
  String text;
  String audio;

  Phonetic({
    required this.text,
    required this.audio,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json['text'],
      audio: json['audio'],
    );
  }
}
