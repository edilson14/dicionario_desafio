class DataBaseQuerys {
  DataBaseQuerys._();

  static const String createWordTable =
      "CREATE TABLE Words(id INTEGER PRIMARY KEY,word TEXT NOT NULL, audiourl TEXT NOT NULL, pheonetic TEXT NOT NULL,meanings TEXT NOT NULL, isFavorite INTEGER NOT NULL)";

  static const String createFavoriteTable =
      "CREATE TABLE favoritesTable(id INTEGER PRIMARY KEY,word TEXT NOT NULL, favorite INTEGER NOT NULL)";
}
