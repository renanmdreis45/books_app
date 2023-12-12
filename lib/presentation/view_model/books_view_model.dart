import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/usecase/get_favorite_books.dart';
import 'package:books_app/domain/usecase/save_favorite_books.dart';
import 'package:flutter/material.dart';
import 'package:books_app/domain/usecase/get_all_books.dart';
import 'package:logger/logger.dart';

class BooksViewModel extends ChangeNotifier {
  GetAllBooks? _getAllBooks;
  GetFavoriteBooks? _getFavoriteBooks;
  SaveFavoriteBooks? _saveFavoriteBooks;

  List<BookModel> books = [];
  List<BookModel> favoriteBooks = [];

  void fetchBooks() async {
    final list = await _getAllBooks?.call();
    var logger = Logger();
    notifyListeners();
  }

  void getFavorites() {
    final favorites = _getFavoriteBooks!.call();
    favoriteBooks.addAll(favorites);
    notifyListeners();
  }

  void saveFavorites() {
    _saveFavoriteBooks!.call(list: favoriteBooks);
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
