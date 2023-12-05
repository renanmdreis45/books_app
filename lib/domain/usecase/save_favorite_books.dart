import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class SaveFavoriteBooks {
  SaveFavoriteBooks({required BooksRepository repository})
      : _repository = repository;

  final BooksRepository _repository;

  Future<bool> call({required List<BookModel> list}) async {
    return _repository.saveFavoriteBooks(list: list);
  }
}
