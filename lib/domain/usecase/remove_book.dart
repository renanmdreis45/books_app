import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class RemoveBook {
   RemoveBook({required BooksRepository repository})
      : _repository = repository;

  final BooksRepository _repository;

  Future<void> call({required BookModel book}) {
    return _repository.removeBook(book: book);
  }
}
