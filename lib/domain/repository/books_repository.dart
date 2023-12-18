import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/domain/model/bookModel.dart';

abstract class BooksRepository {
  Future<DataState<List<BookModel>>> getBooks();
  Future<List<BookModel>> getFavoriteBooks();
  Future<void> saveFavoriteBook({required BookModel book});
  Future<void> removeBook({required BookModel book});
}



