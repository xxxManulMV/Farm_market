import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class ProductDatabase {
  Database? _database;

  // Имя таблицы
  static final String table = 'products';

  // Колонки таблицы
  static final String columnId = '_id';
  static final String columnSellerId = 'seller_id';
  static final String columnCategory = 'category';
  static final String columnName = 'name';
  static final String columnDescription = 'description';
  static final String columnPrice = 'price';
  static final String columnStock = 'stock';
  static final String columnPhoto = 'photo';

  // Конструктор
  ProductDatabase._();
  static final ProductDatabase db = ProductDatabase._();

// Получение базы данных
  Future<Database> get database async {
    return _database ??= await initDB();
  }

  // Инициализация базы данных
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "product.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Создание таблицы
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnSellerId INTEGER,
        $columnCategory TEXT,
        $columnName TEXT,
        $columnDescription TEXT,
        $columnPrice REAL,
        $columnStock INTEGER,
        $columnPhoto BLOB
      )
      ''');
  }

  // Получение списка товаров по категории
  Future<List<Map<String, dynamic>>> getProductsByCategory(String category) async {
    final db = await database;
    return await db.query(table, where: "$columnCategory = ?", whereArgs: [category]);
  }

  // Получение списка товаров по id продавца
  Future<List<Map<String, dynamic>>> getProductsBySellerId(int sellerId) async {
    final db = await database;
    return await db.query(table, where: "$columnSellerId = ?", whereArgs: [sellerId]);
  }

  // Добавление товара
  Future<void> addProduct(String category, int sellerId, String name, String description, double price, int stock, Uint8List photo) async {
    final db = await database;
    await db.insert(table, {
      columnSellerId: sellerId,
      columnCategory: category,
      columnName: name,
      columnDescription: description,
      columnPrice: price,
      columnStock: stock,
      columnPhoto: photo
    });
  }

  // Обновление товара
  Future<void> updateProduct(int id, String category, int sellerId, String name, String description, double price, int stock, Uint8List photo) async {
    final db = await database;
    await db.update(table, {
      columnSellerId: sellerId,
      columnCategory: category,
      columnName: name,
      columnDescription: description,
      columnPrice: price,
      columnStock: stock,
      columnPhoto: photo
    }, where: "$columnId = ?", whereArgs: [id]);
  }

  // Удаление товара
  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }
}