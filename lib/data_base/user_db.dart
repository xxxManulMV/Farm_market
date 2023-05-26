import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class User {
  int? userId;
  String userLastName;
  String userFirstName;
  String userMiddleName;
  String userUsername;
  String userPassword;
  String userEmail;

  User({
    this.userId,
    required this.userLastName,
    required this.userFirstName,
    required this.userMiddleName,
    required this.userUsername,
    required this.userPassword,
    required this.userEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'last_name': userLastName,
      'first_name': userFirstName,
      'middle_name': userMiddleName,
      'username': userUsername,
      'password': userPassword,
      'email': userEmail,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'],
      userLastName: map['last_name'],
      userFirstName: map['first_name'],
      userMiddleName: map['middle_name'],
      userUsername: map['username'],
      userPassword: map['password'],
      userEmail: map['email'],
    );
  }
}

class UserDatabase {
  Database? _database;

  // Имя таблицы
  static final String table = 'users';

  // Колонки таблицы
  static final String columnId = 'id';
  static final String columnLastName = 'last_name';
  static final String columnFirstName = 'first_name';
  static final String columnMiddleName = 'middle_name';
  static final String columnUsername = 'username';
  static final String columnPassword = 'password';
  static final String columnEmail = 'email';

  // Конструктор
  UserDatabase._();
  static final UserDatabase db = UserDatabase._();

  // Получение базы данных
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  // Инициализация базы данных
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "user.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Создание таблицы
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnLastName TEXT,
        $columnFirstName TEXT,
        $columnMiddleName TEXT,
        $columnUsername TEXT,
        $columnPassword TEXT,
        $columnEmail TEXT
      )
      ''');
  }

  // Добавление нового пользователя
  Future<void> addUser(User user) async {
    final db = await database;
    await db.insert(table, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Получение списка всех пользователей
  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  // Найти пользователя по id
  Future<User?> getUser(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
    await db.query(table, where: '$columnId = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }
}