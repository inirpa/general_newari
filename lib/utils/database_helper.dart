import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:general_newari/models/categories.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;
  
  String tableName = 'categories';
  String id = 'id';
  String name = 'name';
  String description = 'description';
  String date = 'date';

  DatabaseHelper._createInstance();
  
  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'general_newari.db';

    var newariDatabase = await openDatabase(path, version: 1, onCreate: _createDB);
    return newariDatabase;
  }
  
  void _createDB(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $description TEXT, $date TEXT)');
    // await db.execute('CREATE TABLE categories(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, date TEXT)');
  }

  Future<List<Map<String, dynamic>>> getCategoryMapList() async{
    Database db = await this.database;
    var result = await db.rawQuery("SELECT * FROM $tableName");
    return result;
  }

  Future<int> insertCategory(Categories category) async{
    Database db = await this.database;
    var result = await db.insert(tableName, category.toMap());
    return result;
  }
  Future<int> updateCategory(Categories category) async{
    Database db = await this.database;
    var result = await db.update(tableName, category.toMap(), where: '$id = ?', whereArgs:[category.id] );
    return result;
  }

  Future<int> deleteCategory(int categoryId) async {
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $tableName WHERE $id = $categoryId');
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $tableName');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Categories>> getCategoryList()  async{
    var categoryMapList = await getCategoryMapList();
    int count = categoryMapList.length;

    List<Categories> categoryList = List<Categories>();
    for(int i=0; i<count; i++){
      categoryList.add(Categories.fromMapObject(categoryMapList[i]));
    }
    return categoryList;
  }
}