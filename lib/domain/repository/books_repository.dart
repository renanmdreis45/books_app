import 'package:challenge_2_escribo/core/resources/data_state.dart';
import 'package:challenge_2_escribo/domain/model/bookModel.dart';

abstract class BooksRepository {
  Future<DataState<List<BookModel>>> getBooks();
}
