import 'dart:convert';

import 'package:dicionario_desafio/env/routes.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import '../models/models.dart';

const String wordsPath = 'assets/english_words.json';

class WordsController extends GetxController {
  final _words = <Word>[].obs;
  final _currentTabIndex = 0.obs;
  final _pageTitle = 'Lista de Palavras'.obs;

  int get currentTab => _currentTabIndex.value;
  String get pageTitle => _pageTitle.value;
  // ignore: invalid_use_of_protected_member
  List<Word> get words => _words.value;

  WordsController() {
    _loadWords();
  }

  void _loadWords() async {
    String data = await rootBundle.loadString(wordsPath);
    var loadedWords = jsonDecode(data) as List<dynamic>;

    _words.value = List.generate(
      loadedWords.length,
      (index) => Word(
        id: index,
        word: loadedWords[index],
      ),
    );
  }

  void handleTabIndexChange(int index) {
    _currentTabIndex.value = index;
    const Map<int, String> titles = {
      0: 'Lista de Palavras',
      1: 'Historico de Palavras',
      2: 'Palavras Favoritas'
    };
    _pageTitle.value = titles[index]!;
  }

  openDetails({required Word word}) {
    Get.toNamed(AppRoutes.wordDetails, arguments: word);
  }
}
