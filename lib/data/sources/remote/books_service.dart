import 'package:challenge_2_escribo/core/constants/constants.dart';
import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
part 'books_service.g.dart';

@RestApi(baseUrl:booksAPIBaseURL)
abstract class BooksService {
  factory BooksService(Dio dio) = _BooksService;
  
  @GET('/top-headlines')
  Future<HttpResponse<List<BookModel>>> getBooks({
    @Query("apiKey") String ? apiKey,
  });
}