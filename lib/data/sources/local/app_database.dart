import 'package:books_app/data/sources/local/DAO/book_dao.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [BookModel])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}
