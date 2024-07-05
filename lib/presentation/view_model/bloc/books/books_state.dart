import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class BookState extends Equatable {
  final List<BookModel>? books;
  final List<BookModel>? favorites;
  final DioException? booksError;
  final String? addFavoritesMessage;
  final DioException? addFavoritesError;
  final String? removeFavoritesMessage;
  final DioException? removeFavoritesError;

  const BookState(
      {this.books,
      this.favorites,
      this.booksError,
      this.addFavoritesMessage,
      this.addFavoritesError,
      this.removeFavoritesMessage,
      this.removeFavoritesError});

  @override
  List<Object> get props => [books!];
}

class BooksLoading extends BookState {
  const BooksLoading();
}

class BooksDone extends BookState {
  const BooksDone(List<BookModel> books) : super(books: books);
}

class BooksError extends BookState {
  const BooksError(DioException error) : super(booksError: error);
}

class FavoritesDone extends BookState {
  const FavoritesDone(List<BookModel> favorites) : super(favorites: favorites);
}

class AddFavoritesSuccess extends BookState {
  const AddFavoritesSuccess(String addFavoritesMessage)
      : super(addFavoritesMessage: addFavoritesMessage);
}

class AddFavoritesError extends BookState {
  const AddFavoritesError(DioException error) : super(addFavoritesError: error);
}

class RemoveFavoritesSucess extends BookState {
  const RemoveFavoritesSucess(String removeFavoritesMessage)
      : super(removeFavoritesMessage: removeFavoritesMessage);
}

class RemoveFavoritesError extends BookState {
  const RemoveFavoritesError(DioException error) : super(removeFavoritesError: error);
}
