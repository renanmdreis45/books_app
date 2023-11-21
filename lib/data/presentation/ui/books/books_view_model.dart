import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/usecase/get_favorite_books.dart';
import 'package:challenge_2_escribo/domain/usecase/save_favorite_books.dart';
import 'package:flutter/material.dart';
import 'package:challenge_2_escribo/domain/usecase/get_all_books.dart';

class BooksViewModel extends ChangeNotifier {
  final GetAllBooks getAllBooks;
  final GetFavoriteBooks getFavoriteBooks;
  final SaveFavoriteBooks saveFavoriteBooks;

  BooksViewModel({required this.getAllBooks, required this.getFavoriteBooks, required this.saveFavoriteBooks});

  List<BookModel> books = [];
  List<BookModel> favoriteBooks = [];

  void fetchBooks() {
    getAllBooks.call().then((value) {
      books.addAll(value);
    });
  }

  void getFavorites() {
    final favorites = getFavoriteBooks.call();
    favoriteBooks.addAll(favorites);
  }

  void saveFavorites() {
    saveFavoriteBooks.call(list: favoriteBooks);
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
