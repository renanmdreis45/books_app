import 'package:challenge_2_escribo/core/resources/data_state.dart';
import 'package:challenge_2_escribo/data/sources/remote/api.dart';
import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:challenge_2_escribo/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final Api _api;

  BooksRepositoryImpl({
    required Api api,
  }) : _api = api;

  @override
  Future<DataState<List<BookModel>>> getBooks() async {
    try {
      final httpResponse = await _api.getBooks();

      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucess(httpResponse.data);
      }
    }
  }
}
