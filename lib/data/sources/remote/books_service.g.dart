part of 'books_service.dart';

class _BooksService implements BooksService {
  _BooksService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/books/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<BookModel>>> getBooks({q, download, key}) async {
    const _extra = <String, dynamic>{};

    Map<String, dynamic> queryParameters = {
      "q": q,
      "download": download,
      "key": key,
    };

    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};

    final _result =
        await _dio.get(baseUrl ?? _dio.options.baseUrl, queryParameters: queryParameters);

    print(_result);
    List<BookModel> value = _result.data!['items']
        .map<BookModel>(
            (dynamic i) => BookModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
