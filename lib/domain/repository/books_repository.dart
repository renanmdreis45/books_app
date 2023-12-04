import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/domain/model/bookModel.dart';

abstract class BooksRepository {
  Future<DataState<List<BookModel>>> getBooks();
}
