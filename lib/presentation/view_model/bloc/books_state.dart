import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  final List<BookModel>? books;

  const BookState({this.books});

  @override
  List<Object> get props => [books!];
}

class BooksLoading extends BookState {
  const BooksLoading();
}

class BooksDone extends BookState {
  const BooksDone(List<BookModel> books) : super(books: books);
}
