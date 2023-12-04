import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/favorites_repository.dart';

class SaveFavoriteBooks {
  SaveFavoriteBooks({required FavoritesRepository repository})
      : _repository = repository;

  final FavoritesRepository _repository;

  Future<bool> call({required List<BookModel> list}) async {
    return _repository.saveFavoriteBooks(list: list);
  }
}
