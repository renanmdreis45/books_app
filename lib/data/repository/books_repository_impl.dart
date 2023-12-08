import 'dart:io';

import 'package:books_app/core/constants/constants.dart';
import 'package:books_app/core/resources/data_state.dart';
import 'package:books_app/data/sources/local/local_storage.dart';
import 'package:books_app/data/sources/remote/books_service.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:books_app/domain/repository/books_repository.dart';
import 'package:dio/dio.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksService _booksService;
  final LocalStorageImpl _localStorage;

  BooksRepositoryImpl(this._booksService, this._localStorage);

  @override
  Future<DataState<List<BookModel>>> getBooks() async {
    try {
      final httpResponse =
          await _booksService.getBooks(q: q, download: download, key: key);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucess(httpResponse.data);
      } else {
        return DataError(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  List<BookModel> getFavoriteBooks() {
    final favoriteBooks = _localStorage.getFavoriteBooks();

    return favoriteBooks;
  }

  @override
  Future<bool> saveFavoriteBooks({
    required List<BookModel> list,
  }) {
    return _localStorage.saveFavoriteBooks(list: list);
  }
}
