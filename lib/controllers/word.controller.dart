// ignore_for_file: invalid_use_of_protected_member

import 'package:dicionario_desafio/api/api.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class WordController extends GetxController {
  final _loadingWord = true.obs;
  bool get loadingWord => _loadingWord.value;

  final DioServices _services = Get.find<DioServices>();

  late Word _word;
  final _wordInfoModel = <WordInfoModel>[].obs;
  String get pheonethic => _wordInfoModel
      .firstWhere((element) => element.phonetic != null)
      .phonetic!;
  List<WordInfoModel> get wordInfo => _wordInfoModel.value;

  Word get currentWord => _word;

  WordController() {
    _getWord();
  }

  void _getWord() {
    _word = Get.arguments;
    _loadWordInfo(_word);
  }

  Future<void> _loadWordInfo(Word word) async {
    try {
      _loadingWord.value = true;
      var response = await _services.getWordInfo(word: word.word);

      response.forEach((word) {
        WordInfoModel info = WordInfoModel.fromJson(word);
        _wordInfoModel.add(info);
      });

      _loadingWord.value = false;
    } catch (e) {
      _loadingWord.value = false;
    }
  }
}
