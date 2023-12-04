import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/favorites_repository.dart';

class GetFavoriteBooks {
  GetFavoriteBooks({required FavoritesRepository repository})
      : _repository = repository;

  final FavoritesRepository _repository;

  List<BookModel> call() {
    final list = _repository.getFavoriteBooks();

    return list;
  }
}
