import 'package:challenge_2_escribo/data/sources/local/local_storage.dart';
import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/repository/favorites_repository.dart';

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
