import 'package:books_app/core/constants/constants.dart';
import 'package:books_app/domain/model/bookModel.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
part 'books_service.g.dart';

@RestApi(baseUrl: booksAPIBaseURL)
abstract class BooksService {
  factory BooksService(Dio dio) = _BooksService;

  @GET('/volumes')
  Future<HttpResponse<List<BookModel>>> getBooks({
    @Query("q") String? q,
    @Query("download") String? download,
    @Query("key") String? key,
  });
}
