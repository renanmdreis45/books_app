import 'package:books_app/domain/model/bookModel.dart';

abstract class BooksEvent {
  final List<BookModel>? books;
  final List<BookModel>? favorites;
  final BookModel? newFavoriteBook;
  final BookModel? removeBook;

  BooksEvent(
      {this.books, this.favorites, this.newFavoriteBook, this.removeBook});
}

class GetBooks extends BooksEvent {
  GetBooks({List<BookModel>? books}) : super(books: books!);
}

class GetFavorites extends BooksEvent {
  GetFavorites({List<BookModel>? favorites}) : super(favorites: favorites!);
}

class AddFavorites extends BooksEvent {
  AddFavorites({BookModel? book}) : super(newFavoriteBook: book!);
}

class RemoveFavorites extends BooksEvent {
  RemoveFavorites({BookModel? book}) : super(removeBook: book);
}
