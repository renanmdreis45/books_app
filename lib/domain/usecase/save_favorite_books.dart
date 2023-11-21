import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/repository/favorites_repository.dart';

class SaveFavoriteBooks {
  SaveFavoriteBooks({required FavoritesRepository repository})
      : _repository = repository;

  final FavoritesRepository _repository;

  Future<bool> call({required List<BookModel> list}) async {
    return _repository.saveFavoriteBooks(list: list);
  }
}
