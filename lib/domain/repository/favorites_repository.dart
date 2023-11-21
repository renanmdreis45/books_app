import 'package:challenge_2_escribo/domain/model/bookModel.dart';

abstract class FavoritesRepository {
  List<BookModel> getFavoriteBooks();
  Future<bool> saveFavoriteBooks({required List<BookModel> list});
}
