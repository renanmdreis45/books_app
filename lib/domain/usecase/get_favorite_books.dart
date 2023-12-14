import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class GetFavoriteBooks {
  GetFavoriteBooks({required BooksRepository repository})
      : _repository = repository;

  final BooksRepository _repository;

  Future<List<BookModel>> call() {
    final list = _repository.getFavoriteBooks();

    return list;
  }
}
