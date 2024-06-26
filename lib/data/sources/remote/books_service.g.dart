part of 'books_service.dart';

class _BooksService implements BooksService {
  _BooksService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/books/v1/volumes';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<BookModel>>> getBooks({q, download, key}) async {
    Map<String, dynamic> queryParameters = {
      "q": q,
      "download": download,
      "key": key,
    };

    final _result = await _dio.get(baseUrl ?? _dio.options.baseUrl,
        queryParameters: queryParameters);
    
    List<BookModel> value = _result.data!['items'].map<BookModel>((dynamic i) {
      
      return BookModel.fromJson(i as Map<String, dynamic>);
    }).toList();
    
    final httpResponse = HttpResponse(value, _result);

    return httpResponse;
  }
}
