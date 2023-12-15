import 'package:books_app/domain/model/bookModel.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  final BookModel? book;

  const FavoritesEvent({this.book});

  @override
  List<Object> get props => [book!];
}

class GetFavorites extends FavoritesEvent {
  const GetFavorites();
}

class RemoveFavorite extends FavoritesEvent {
  const RemoveFavorite(BookModel book) : super(book: book);
}

class AddBook extends FavoritesEvent {
  const AddBook(BookModel book) : super(book: book);
}
