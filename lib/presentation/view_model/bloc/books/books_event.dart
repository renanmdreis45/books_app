import 'package:books_app/domain/model/bookModel.dart';

abstract class BooksEvent {
  const BooksEvent();
}

class GetBooks extends BooksEvent {
  const GetBooks();
}

class GetFavorites extends BooksEvent {
  const GetFavorites();
}

class AddFavorites extends BooksEvent {
  const AddFavorites(this.book);

  final BookModel book;

  @override
  List<Object> get props => [book];
}
