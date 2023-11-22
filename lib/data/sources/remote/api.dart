import 'package:challenge_2_escribo/domain/model/bookModel.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class Api {
  Future<List<BookModel>> getBooks();
}

class ApiImpl implements Api {
  final dio = Dio();
  String url = "https://escribo.com/books.json";
  var logger = Logger();

  @override
  Future<List<BookModel>> getBooks() async {
    try {
      Response response;

      response = await dio.get(url);

      final books =
          (response.data as List).map((e) => BookModel.fromJson(e)).toList();
      
      return books;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        if (e.response?.statusCode == 404) return [];
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }

    return [];
  }
}
