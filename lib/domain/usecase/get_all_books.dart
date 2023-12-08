import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class GetAllBooks {
  GetAllBooks({required BooksRepository repository}) : _repository = repository;

  final BooksRepository _repository;

  Future<DataState<List<BookModel>>> call() async {
    final list = await _repository.getBooks();
    return list;
  }
}
