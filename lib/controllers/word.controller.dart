// ignore_for_file: invalid_use_of_protected_member

import 'package:dicionario_desafio/services/services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class WordController extends GetxController {
  final _loadingWord = true.obs;
  bool get loadingWord => _loadingWord.value;
  final DioServices _services = Get.find<DioServices>();

  final DataBaseServices _dataBaseServices = Get.find<DataBaseServices>();

  late Word _word;
  final _wordResponseModel = <WordResponseModel>[].obs;
  late Rx<WordInfoModel> _wordModel;

  WordInfoModel get word => _wordModel.value;

  WordController() {
    _getWord();
  }

  void _getWord() async {
    _word = Get.arguments;
    WordInfoModel? wordInfoModel =
        await _dataBaseServices.getWordById(wordId: _word.id);
    if (wordInfoModel == null) {
      _loadWordInfo(_word);
    } else {
      _wordModel = Rx(wordInfoModel);
      _loadingWord.value = false;
    }
  }

  Future<void> _loadWordInfo(Word word) async {
    try {
      _loadingWord.value = true;
      var response = await _services.getWordInfo(word: word.word);
      if (response != null) {
        response.forEach((word) {
          WordResponseModel info = WordResponseModel.fromJson(word);
          _wordResponseModel.add(info);
        });

        _buildWordInfos(_wordResponseModel.value);

        _loadingWord.value = false;
      }
    } catch (e) {
      _loadingWord.value = false;
    }
  }

  void _buildWordInfos(List<WordResponseModel> words) {
    _wordModel = Rx(
      WordInfoModel.fromWordResponse(_word.id, words: words),
    );
    _dataBaseServices.saveWord(_wordModel.value);
  }
}
