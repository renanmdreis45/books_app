import 'package:challenge_2_escribo/data/sources/remote/api.dart';
import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final Api _api;

  BooksRepositoryImpl({
    required Api api,
  }) : _api = api;

  @override
  Future<List<BookModel>> getBooks() async {
    final fetchedList = await _api.getBooks();
    print(fetchedList);
    return fetchedList;
  }
}
