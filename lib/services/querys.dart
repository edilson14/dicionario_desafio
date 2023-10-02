class DataBaseQuerys {
  DataBaseQuerys._();

  static const String createWordTable =
      "CREATE TABLE Words(id INTEGER PRIMARY KEY,word TEXT NOT NULL, audiourl TEXT NOT NULL, pheonetic TEXT NOT NULL,meanings TEXT NOT NULL)";
}
