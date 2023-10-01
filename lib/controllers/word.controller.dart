import 'dart:convert';

import 'package:dicionario_desafio/api/api.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class WordController extends GetxController {
  final _loadingWord = true.obs;
  bool get loadingWord => _loadingWord.value;

  final DioServices _services = Get.find<DioServices>();

  Word? _word;
  WordInfoModel? _wordInfoModel;

  WordController() {
    _getWord();
  }

  void _getWord() {
    _word = Get.arguments;
    if (_word != null) _loadWordInfo(_word!);
  }

  Future<void> _loadWordInfo(Word word) async {
    try {
      _loadingWord.value = true;
      var response = await _services.getWordInfo(word: word.word);
      print(jsonEncode(response));
      _loadingWord.value = false;
    } catch (e) {
      _loadingWord.value = false;
    }
  }
}
