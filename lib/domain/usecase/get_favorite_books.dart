import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/repository/favorites_repository.dart';

class GetFavoriteBooks {
  GetFavoriteBooks({required FavoritesRepository repository})
      : _repository = repository;

  final FavoritesRepository _repository;

  List<BookModel> call()  {
    final list = _repository.getFavoriteBooks();

    return list;
  }
}
