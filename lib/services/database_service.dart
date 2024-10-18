import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/daily_summary.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'weather_database.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE daily_summaries(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT,
          avgTemperature REAL,
          maxTemperature REAL,
          minTemperature REAL,
          dominantCondition TEXT
        )
      ''');
    });
  }

  Future<int> insertDailySummary(DailySummary summary) async {
    final db = await database;
    return await db.insert('daily_summaries', summary.toMap());
  }

  Future<List<DailySummary>> getDailySummaries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('daily_summaries');
    return List.generate(maps.length, (i) => DailySummary.fromMap(maps[i]));
  }
}