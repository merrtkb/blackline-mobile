import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('car_market.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 6, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
  CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
)
''');

    await db.execute('''
   CREATE TABLE cars(
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  price INTEGER NOT NULL,
  image TEXT NOT NULL,
  power TEXT NOT NULL,
  acceleration TEXT NOT NULL,
  topSpeed TEXT NOT NULL,
  description TEXT NOT NULL,
  soundUrl TEXT NOT NULL,
  category TEXT NOT NULL,
  year INTEGER NOT NULL
)
''');

    await db.execute('''
CREATE TABLE favorites(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userEmail TEXT NOT NULL,
  carId TEXT NOT NULL,
  carName TEXT NOT NULL,
  image TEXT NOT NULL
)
''');

    await db.execute('''
CREATE TABLE requests(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userEmail TEXT NOT NULL,
  carId TEXT NOT NULL,
  carName TEXT NOT NULL,
  phone TEXT NOT NULL,
  message TEXT NOT NULL,
  status TEXT NOT NULL
)
''');
  }
}
