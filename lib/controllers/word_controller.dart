// ignore_for_file: invalid_use_of_protected_member

import 'package:dicionario_desafio/controllers/words_controller.dart';
import 'package:dicionario_desafio/services/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../models/models.dart';

enum AudioStatus { playing, paused }

class WordController extends GetxController {
  final _loadingWord = true.obs;
  bool get loadingWord => _loadingWord.value;
  final DioServices _services = Get.find<DioServices>();

  final DataBaseServices _dataBaseServices = Get.find<DataBaseServices>();
  final WordsController _wordsController = Get.find<WordsController>();
  bool get canNavigateNext => _word.id < _wordsController.words.length;

  late Word _word;
  final _wordResponseModel = <WordResponseModel>[].obs;
  late Rx<WordInfoModel> _wordModel;

  final _audioStatus = AudioStatus.paused.obs;
  final _audioPlayer = AudioPlayer();

  AudioStatus get audioStatus => _audioStatus.value;

  WordInfoModel get word => _wordModel.value;

  WordController() {
    _getWord();
  }

  void _getWord({Word? word}) async {
    _loadingWord.value = true;
    if (word == null) {
      _word = Get.arguments;
    } else {
      _word = word;
    }

    WordInfoModel? wordInfoModel =
        await _dataBaseServices.getWordById(wordId: _word.id);
    if (wordInfoModel == null) {
      _loadWordInfo(_word);
    } else {
      _wordModel = Rx(wordInfoModel);
      if (_wordModel.value.audiourl.isNotEmpty) {
        await _audioPlayer.setUrl(_wordModel.value.audiourl);
      }
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

  void _buildWordInfos(List<WordResponseModel> words) async {
    _wordModel = Rx(
      WordInfoModel.fromWordResponse(
        _word.id,
        _word.favorite,
        words: words,
      ),
    );
    if (_wordModel.value.audiourl.isNotEmpty) {
      await _audioPlayer.setUrl(_wordModel.value.audiourl);
    }
    _dataBaseServices.saveWord(_wordModel.value);
  }

  void playAudio() {
    _audioStatus.value = AudioStatus.playing;
    _audioPlayer.play().whenComplete(
      () {
        _audioStatus.value = AudioStatus.paused;
        _audioPlayer.seek(Duration.zero);
      },
    );
  }

  void handleNavigation({next = true}) {
    Word navigatioWord;
    int wordId;
    if (next) {
      wordId = word.id + 1;
      navigatioWord = _wordsController.words.firstWhere(
        (element) => element.id == wordId,
      );
    } else {
      wordId = word.id - 1;
      navigatioWord = _wordsController.words.firstWhere(
        (element) => element.id == wordId,
      );
    }

    _getWord(word: navigatioWord);
  }
}
