import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:flutter/foundation.dart';

class FavoritesViewModel extends ChangeNotifier {

    FavoritesViewModel({
    required GetFavoriteBooks getFavoriteBooks,
    required SaveFavoriteBooks saveFavoriteBooks,
  })  : _getFavoriteBooks = getFavoriteBooks,
        _saveFavoriteBooks = saveFavoriteBooks;

  final GetFavoriteBooks _getFavoriteBooks;
  final SaveFavoriteBooks _saveFavoriteBooks;


  List<BookModel> favoriteBooks = [];

  void fetchFavorites() {
    final favorites = _getFavoriteBooks.call();
    favoriteBooks.addAll(favorites);
  }

  void saveFavorites() {
    _saveFavoriteBooks.call(list: favoriteBooks);
  }

  void removeFromFavorites(int index) {
    favoriteBooks.removeAt(index);
  }
}
