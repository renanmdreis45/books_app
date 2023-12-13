import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  final BookModel? book;

  const FavoritesEvent({this.book});

  @override
  List<Object> get props => [book!];
}

class GetFavoriteBooks extends FavoritesEvent {
  const GetFavoriteBooks();
}

class RemoveBook extends FavoritesEvent {
  const RemoveBook(BookModel book) : super(book: book);
}

class AddBook extends FavoritesEvent {
  const AddBook(BookModel book) : super(book: book);
}
