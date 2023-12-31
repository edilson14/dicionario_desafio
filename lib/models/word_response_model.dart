import 'package:get/get.dart';

class WordResponseModel {
  String word;
  String? phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  String? audioUrl;

  WordResponseModel({
    required this.word,
    this.phonetic,
    required this.phonetics,
    required this.meanings,
    this.audioUrl,
  });

  factory WordResponseModel.fromJson(Map<String, dynamic> json) {
    final pheonethics = <Phonetic>[];
    final meanings = <Meaning>[];
    for (var pheonetic in json['pheonetics']) {
      pheonethics.add(Phonetic.fromJson(pheonetic));
    }
    for (var meaning in json['meanings']) {
      meanings.add(Meaning.fromJson(meaning));
    }

    return WordResponseModel(
      word: json['word'],
      audioUrl: pheonethics
          .firstWhereOrNull(
            (element) => element.audio.isNotEmpty,
          )
          ?.audio,
      phonetic: json['phonetic'].toString().replaceAll('/', ''),
      phonetics: pheonethics,
      meanings: meanings,
    );
  }
}

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    var definitions = <Definition>[];
    for (var definition in json['definitions']) {
      definitions.add(Definition.fromJson(definition));
    }

    return Meaning(
      partOfSpeech: json['partOfSpeech'],
      definitions: definitions,
    );
  }
}

class Definition {
  String definition;
  String? example;

  Definition({
    required this.definition,
    this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'],
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
