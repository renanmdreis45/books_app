import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class SaveFavoriteBooks {
  SaveFavoriteBooks({required BooksRepository repository})
      : _repository = repository;

  final BooksRepository _repository;

  Future<void> call({required BookModel book}) async {
    return _repository.saveFavoriteBook(book: book);
  }
}
