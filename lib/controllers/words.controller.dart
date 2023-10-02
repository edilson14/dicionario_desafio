// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:dicionario_desafio/env/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import '../models/models.dart';

const String wordsPath = 'assets/english_words.json';

class WordsController extends GetxController {
  final _words = <Word>[].obs;
  final _currentTabIndex = 0.obs;
  final _pageTitle = 'Lista de Palavras'.obs;
  final _favoritesWordsId = <int>[].obs;

  int get currentTab => _currentTabIndex.value;
  String get pageTitle => _pageTitle.value;
  List<Word> get words => _words.value;
  List<int> get favorites => _favoritesWordsId.value;
  bool isFavorite(int id) => _favoritesWordsId.contains(id);

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
        favorite: false,
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

  void handleFavorite(BuildContext context, {required Word word}) {
    word.favorite = !word.favorite;

    _words.value[word.id] = word;
    _words.refresh();
  }
}
