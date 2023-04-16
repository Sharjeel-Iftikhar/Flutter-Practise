import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart'as sql;

import '../model/product.dart';

class sql_helper {

  static sql.Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await sql.getDatabasesPath() + "tasks.db";
      _db = await sql.openDatabase(
          _path,
          version: _version,
          onCreate: (db, version) async {
            print("creating a new one");
            return db.execute("""CREATE TABLE $_tableName(
             id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
             title TEXT,
             description TEXT,
             createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
             )""");
          }
      );
    }
    catch (e) {
      print(e);
    }
  }

  // function to save items in the database
  // INSERT method
  static Future<int> Additems(Product? pro) async {
    print("adding product to database");
    // first we are checking if the database is null or not ,then pro! is checking pro object null or not then ?? is doing is
    // to check if db is null then use a random number which in this case is 1.
    return await _db?.insert(_tableName,pro!.toJson(),conflictAlgorithm: sql.ConflictAlgorithm.replace)??1;
  }



//
  // VIEW_ALL
  static Future<List<Map<String,dynamic>>> query()async{
    print('query function called');
    return await _db!.query(_tableName);
  }
  // ViEW_ONE by id
  static Future<List<Map<String,dynamic>>> viewOne(int id) async{
    print('Get one function called');
    return await  _db!.query(_tableName,where: "id = ?",whereArgs: [id],limit: 1);
  }

//   // UPDATE_ITEMS
  static Future<void> update(int id,Product pro) async{
    //final db = await sql_helper.db();
    print("calling update function");
    print(pro.title);
    final result = _db?.rawUpdate('''
    UPDATE $_tableName
    SET title = ?,
    description =?
    WHERE id = ? 
    ''',[pro.title,pro.description,id]);
    //final result = await _db?.update(_tableName,pro.toJson() , where: "id = ?",whereArgs: [id]);
    
  }
//
  // DELETE_Items
  static Future<void> deleteItem(int id )async{
    // final  db = await sql_helper._db;
    try{

        await _db!.delete(_tableName,where: "id = ?",whereArgs: [id]);
    }
    catch(err){
      debugPrint("Something went wrong when deleting an item");
    }
  }
}
