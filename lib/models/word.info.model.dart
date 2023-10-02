import 'models.dart';

class WordInfoModel {
  int id;
  String word;
  String audiourl;
  String pheonetic;
  List<String> meaning;

  WordInfoModel({
    required this.id,
    required this.word,
    required this.audiourl,
    required this.pheonetic,
    required this.meaning,
  });

  factory WordInfoModel.fromWordResponse(
    int id, {
    required List<WordResponseModel> words,
  }) {
    return WordInfoModel(
      id: id,
      audiourl: _getAudioUrl(words: words),
      word: words[0].word,
      pheonetic: _getPheonetic(words: words),
      meaning: _getMeanigns(words: words),
    );
  }

  static String _getAudioUrl({required List<WordResponseModel> words}) {
    String? audio;
    for (var element in words) {
      if (element.audioUrl != null) {
        audio = element.audioUrl;
      }
    }
    return audio!;
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
    return pheonetic!;
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
}
