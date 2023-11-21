import 'package:challenge_2_escribo/domain/model/bookModel.dart';

abstract class BooksRepository {
  Future<List<BookModel>> getBooks();
}
