import 'package:books_app/domain/model/bookModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  List<BookModel> getFavoriteBooks();
  Future<bool> saveFavoriteBooks({required List<BookModel> list});
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;
  final key = "FAVORITE_BOOKS";

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  @override
  List<BookModel> getFavoriteBooks() {
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => bookModelFromJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveFavoriteBooks({
    required List<BookModel> list,
  }) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    return _sharedPref.setStringList(key, jsonList);
  }
}
