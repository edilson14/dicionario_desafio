import 'package:dicionario_desafio/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'services.dart';

const String dataBaseName = 'dicionario.db';
const String wordTable = 'Words';

class DataBaseServices {
  late Database _database;

  DataBaseServices() {
    initialize();
  }

  Future<void> initialize() async {
    final String dataBasePath = await getDatabasesPath();

    _database = await openDatabase(
      join(dataBasePath, dataBaseName),
      onCreate: (database, version) async {
        await database.execute(DataBaseQuerys.createWordTable);
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

  Future<WordInfoModel?> getWordById({required int wordId}) async {
    final db = _database;
    List<Map> word =
        await db.query(wordTable, where: 'id = ?', whereArgs: [wordId]);
    return word.isNotEmpty ? WordInfoModel.fromDataBase(word[0]) : null;
  }
}
