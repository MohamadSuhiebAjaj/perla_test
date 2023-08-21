// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../../modules/home/data/model/note_model.dart';
import '../errors/exeptions.dart';

class NoteDataBaseSerives {
  static final NoteDataBaseSerives instance = NoteDataBaseSerives._init();
  static Database? _database;

  NoteDataBaseSerives._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int vesion) async {
    const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const String textType = 'TEXT NOT NULL';

    await db.execute(
        'CREATE TABLE notes ( ${NoteFields.id} $idType, ${NoteFields.text} $textType, ${NoteFields.createdAt} $textType )');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<NoteModel>> createNote(Map<String, dynamic> map) async {
    final db = await instance.database;
    await db.insert('notes', map);
    return await readAllNotes();
  }

  Future<NoteModel> getNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'notes',
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      throw const LocalExcption("Note Not Fount");
    }
    return NoteModel.fromJson(maps.first);
  }

  Future<List<NoteModel>> readAllNotes() async {
    final db = await instance.database;
    final maps = await db.query('notes' , orderBy: '${NoteFields.createdAt} DESC');
    return maps.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<List<NoteModel>> update(int id, Map<String, dynamic> map) async {
    final db = await instance.database;
    await db.update(
      'notes',
      map,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    return await readAllNotes();
  }

  Future<List<NoteModel>> delete(int id) async {
    final db = await instance.database;
    db.delete(
      'notes',
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
    return await readAllNotes();
  }
}

class NoteFields {
  static const String id = '_id';
  static const String text = 'name';
  static const String createdAt = 'created_at';
  static final List<String> values = [
    id,
    text,
    createdAt,
  ];
}
