import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:project_l/interface/List-interface.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ListDataBase {
  ListDataBase._privateConstructor();
  static final ListDataBase instance = ListDataBase._privateConstructor();

  static Database? _dataBase;
  Future<Database> get database async => _dataBase ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'list.db');
    return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
    );
  }
  
  Future _onCreate(Database db, int versions) async {
    await db.execute('''
    CREATE TABLE list(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    content TEXT,
    checkBox TEXT,
    position integer
    )
    ''');
  }

  Future<List<ListInterface>> getListValues() async {
    Database db = await instance.database;
    var response = await db.query('list', orderBy: 'id');
    List<ListInterface> values = response.isNotEmpty
        ? response.map((e) => ListInterface.fromMap(e)).toList()
        : [];
    return values;
  }

  Future<int> add(ListInterface items) async {
    Database db = await instance.database;
    return await db.insert(
        'list',
        items.toMap(false),
    );
  }

  Future<int> updateCheckBox(ListInterface list, bool value) async {
    Database db = await instance.database;
    return db.update('list', list.toMap(value),
        where: 'id = ?', whereArgs: [list.id]);
  }

  Future<int> updateSQL([FormGroup? form, List<dynamic>? parameters]) async {
    String sql = ( ''' update list set
        title = '${form?.control('title').value}' ,
        content = '${form?.control('content').value}' ,
        checkBox = '${form?.control('checkBox').value.toString()}'
        where id = '${form?.control('id').value}' 
        ''');

    Database db = await database;
    return await db.rawUpdate(sql);
  }

  Future<int> onDelete(int? id) async {
    Database db = await database;
    String sql = ''' delete from list where id = '$id' ''';

    return await db.rawDelete(sql);
  }
}
