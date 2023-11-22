import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:flutter/material.dart';
import 'package:challenge_2_escribo/domain/usecase/get_all_books.dart';
import 'package:logger/logger.dart';

class BooksViewModel extends ChangeNotifier {
  GetAllBooks? getAllBooks;
  GetFavoriteBooks? getFavoriteBooks;
  SaveFavoriteBooks? saveFavoriteBooks;

  List<BookModel> books = [];
  List<BookModel> favoriteBooks = [];

  void fetchBooks() async {
    final list = await getAllBooks?.call();
    books.addAll(list!);
    var logger = Logger();
    logger.d(books);
    notifyListeners();
  }

  void getFavorites() {
    final favorites = getFavoriteBooks!.call();
    favoriteBooks.addAll(favorites);
    notifyListeners();
  }

  void saveFavorites() {
    saveFavoriteBooks?.call(list: favoriteBooks);
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
