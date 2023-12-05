import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/data/sources/remote/books_service.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksService _booksService;

  BooksRepositoryImpl({this._booksService});

  @override
  Future<DataState<List<BookModel>>> getBooks() async {
    try {
      final httpResponse = await _booksService.getBooks(
        apiKey: booksApiK
      )
    }
  }
}
