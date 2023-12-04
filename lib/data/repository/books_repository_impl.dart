import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/data/sources/remote/books_service.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final Api _api;

  BooksRepositoryImpl({
    required Api api,
  }) : _api = api;

  @override
  Future<DataState<List<BookModel>>> getBooks() async {
    try {
      final httpResponse = await _api.getBooks();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucess(httpResponse.data);
      }
    } catch (error) {
        
    }
  }
}
