import 'package:books_app/core/resources/data_state.dart';

abstract class BooksRepository {
  Future<DataState> getBooks();
}
