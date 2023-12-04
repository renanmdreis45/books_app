import 'package:books_app/data/sources/local/local_storage.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final LocalStorage _localStorage;
  FavoritesRepositoryImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  List<BookModel> getFavoriteBooks() {
    final favoriteBooks = _localStorage.getFavoriteBooks();

    return favoriteBooks;
  }

  @override
  Future<bool> saveFavoriteBooks({
    required List<BookModel> list,
  }) {
    return _localStorage.saveFavoriteBooks(list: list);
  }
}
