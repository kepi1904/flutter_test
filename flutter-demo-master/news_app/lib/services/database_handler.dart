import 'package:news_app/model/news.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'favorite_news.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE tbl_news(id TEXT PRIMARY KEY, title TEXT NOT NULL, author TEXT, published_date TEXT, link TEXT, excerpt TEXT, summary TEXT, media TEXT, clean_url TEXT)",
        );
      },
      version: 2,
    );
  }

  static Future<void> insertNews(News news) async {
    final Database db = await initializeDB();
    await db.insert('tbl_news', news.toMap());
  }

  static Future<void> deleteNews(String id) async {
    final Database db = await initializeDB();
    await db.delete('tbl_news', where: "id=?", whereArgs: [id]);
  }

  static Future<News> findOneNews(String id) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('tbl_news', where: "id = ?", whereArgs: [id], limit: 1);
    if (queryResult.isNotEmpty) {
      final data = queryResult.first;
      return News.fromJson(data);
    } else {
      return UninitializedNews();
    }
  }

  static Future<List<News>> retrieveNews() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('tbl_news');
    return queryResult.map((news) => News.fromJson(news)).toList();
  }
}
