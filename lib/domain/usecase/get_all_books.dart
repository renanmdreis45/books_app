import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/repository/books_repository.dart';
import 'package:logger/logger.dart';

class GetAllBooks {
  GetAllBooks({required BooksRepository repository}) : _repository = repository;

  final BooksRepository _repository;

  Future<List<BookModel>> call() async {
    final list = await _repository.getBooks();
    var logger = Logger();
    logger.d(list);
    return list;
  }
}
