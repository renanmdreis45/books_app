import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:flutter/foundation.dart';

class FavoritesViewModel extends ChangeNotifier {
  final GetFavoriteBooks getFavoriteBooks;
  final SaveFavoriteBooks saveFavoriteBooks;

  FavoritesViewModel(
      {required this.getFavoriteBooks, required this.saveFavoriteBooks});

  List<BookModel> favoriteBooks = [];

  void fetchFavorites() {
    final favorites = getFavoriteBooks.call();
    favoriteBooks.addAll(favorites);
  }

  void saveFavorites() {
    saveFavoriteBooks.call(list: favoriteBooks);
  }

  void removeFromFavorites(int index) {
    favoriteBooks.removeAt(index);
  }
}
