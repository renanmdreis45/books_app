import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:flutter/material.dart';
import 'package:challenge_2_escribo/domain/usecase/get_all_books.dart';
import 'package:logger/logger.dart';

class BooksViewModel extends ChangeNotifier {
  BooksViewModel({
    required GetAllBooks getAllBooks,
    required GetFavoriteBooks getFavoriteBooks,
    required SaveFavoriteBooks saveFavoriteBooks,
  })  : _getAllBooks = getAllBooks,
        _getFavoriteBooks = getFavoriteBooks,
        _saveFavoriteBooks = saveFavoriteBooks;

  final GetAllBooks _getAllBooks;
  final GetFavoriteBooks _getFavoriteBooks;
  final SaveFavoriteBooks _saveFavoriteBooks;

  List<BookModel> books = [];
  List<BookModel> favoriteBooks = [];

  void fetchBooks() async {
    final list = await _getAllBooks.call();
    var logger = Logger();
    logger.d(list);
    notifyListeners();
  }

  void getFavorites() {
    final favorites = _getFavoriteBooks.call();
    favoriteBooks.addAll(favorites);
    notifyListeners();
  }

  void saveFavorites() {
    _saveFavoriteBooks.call(list: favoriteBooks);
    notifyListeners();
  }

  void addToFavorites(BookModel book) {
    favoriteBooks.add(book);
    saveFavorites();
  }

  void removeFromFavorites(int index) {
    favoriteBooks.removeAt(index);
    saveFavorites();
  }
}
