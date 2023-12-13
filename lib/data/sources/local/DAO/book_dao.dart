import 'package:books_app/domain/model/bookModel.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {
  @Insert()
  Future<void> insertBook(BookModel book);

  @delete
  Future<void> removeBook(BookModel book);

  @Query('SELECT * FROM book')
  Future<List<BookModel>> getFavoriteBooks();
}
