import 'package:dicionario_desafio/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'services.dart';

const String dataBaseName = 'dicionario.db';
const String wordTable = 'Words';
const String favoritesTable = 'favoritesTable';

class DataBaseServices {
  late Database _database;

  Future<void> initialize() async {
    final String dataBasePath = await getDatabasesPath();

    _database = await openDatabase(
      join(dataBasePath, dataBaseName),
      onCreate: (database, version) async {
        await database.execute(DataBaseQuerys.createWordTable);
        await database.execute(DataBaseQuerys.createFavoriteTable);
      },
      version: 1,
    );
  }

  Future<void> saveWord(WordInfoModel wordInfoModel) async {
    await _database.insert(
      wordTable,
      wordInfoModel.toMap(),
    );
  }

  Future<List<Word>> getSavedWords() async {
    var words = <Word>[];
    var db = _database;

    List<Map> savedWords = await db.query(wordTable);

    for (var word in savedWords) {
      words.add(
        Word(
          id: word['id'],
          word: word['word'],
          favorite: word['isFavorite'] == 1 ? true : false,
        ),
      );
    }
    return words;
  }

  Future<WordInfoModel?> getWordById({required int wordId}) async {
    final db = _database;
    List<Map> word = await db.query(wordTable, where: 'id = ?', whereArgs: [wordId]);
    return word.isNotEmpty ? WordInfoModel.fromDataBase(word[0]) : null;
  }

  Future<void> addFavorite(Word word) async {
    final db = _database;
    await db.insert(favoritesTable, word.toMap());
  }

  Future<void> deleteFavorite(Word word) async {
    var db = _database;
    await db.delete(
      favoritesTable,
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<List<Word>> getFavoritesWords() async {
    var words = <Word>[];
    final db = _database;
    List<Map> favorites = await db.query(favoritesTable);

    for (var element in favorites) {
      words.add(
        Word.fromDataBase(element),
      );
    }

    return words;
  }
}
