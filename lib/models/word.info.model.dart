import 'dart:convert';

import 'models.dart';

class WordInfoModel {
  int id;
  String word;
  String audiourl;
  String pheonetic;
  List<String> meanings;
  bool isFavorite;

  WordInfoModel({
    required this.id,
    required this.word,
    required this.audiourl,
    required this.pheonetic,
    required this.meanings,
    required this.isFavorite,
  });

  factory WordInfoModel.fromWordResponse(
    int id,
    bool isFavorite, {
    required List<WordResponseModel> words,
  }) {
    return WordInfoModel(
      id: id,
      audiourl: _getAudioUrl(words: words),
      word: words[0].word,
      pheonetic: _getPheonetic(words: words),
      meanings: _getMeanigns(words: words),
      isFavorite: isFavorite,
    );
  }

  factory WordInfoModel.fromDataBase(Map dataBase) {
    var meanings = <String>[];
    jsonDecode(dataBase['meanings']).forEach((meaning) {
      meanings.add(meaning);
    });

    return WordInfoModel(
      id: dataBase['id'],
      word: dataBase['word'],
      audiourl: dataBase['audiourl'],
      pheonetic: dataBase['pheonetic'],
      meanings: meanings,
      isFavorite: dataBase['isFavorite'] == 1 ? true : false,
    );
  }

  static String _getAudioUrl({required List<WordResponseModel> words}) {
    String? audio;
    for (var element in words) {
      if (element.audioUrl != null) {
        audio = element.audioUrl;
      }
    }
    return audio ?? '';
  }

  static String _getPheonetic({
    required List<WordResponseModel> words,
  }) {
    String? pheonetic;

    for (var element in words) {
      while (pheonetic == null) {
        if (element.phonetic != null) {
          pheonetic = element.phonetic;
        }
      }
    }
    return pheonetic == 'null' ? 'Não possui - fonetica' : pheonetic!;
  }

  static List<String> _getMeanigns({
    required List<WordResponseModel> words,
  }) {
    var meanings = <String>[];

    for (var element in words) {
      for (var meaning in element.meanings) {
        meanings.add(
            '${meaning.partOfSpeech} - ${meaning.definitions[0].definition}');
      }
    }
    return meanings;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'audiourl': audiourl,
      'pheonetic': pheonetic,
      'meanings': jsonEncode(meanings),
      'isFavorite': isFavorite ? 1 : 0,
    };
  }
}
