import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class BookState extends Equatable {
  final List<BookModel>? books;
  final DioException? error;

  const BookState({this.books, this.error});

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
