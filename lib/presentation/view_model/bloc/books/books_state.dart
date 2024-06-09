import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class BookState extends Equatable {
  final List<BookModel>? books;
  final List<BookModel>? favorites;
  final DioException? error;

  const BookState({this.books, this.favorites, this.error});

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
  const BooksError(DioException error) : super(error: error);
}

class FavoritesDone extends BookState {
  const FavoritesDone(List<BookModel> favorites) : super(favorites: favorites);
}
