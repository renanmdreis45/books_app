import 'package:books_app/domain/model/bookModel.dart';

abstract class FavoritesRepository {
  List<BookModel> getFavoriteBooks();
  Future<bool> saveFavoriteBooks({required List<BookModel> list});
}
