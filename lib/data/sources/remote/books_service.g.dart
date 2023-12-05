
part of 'books_service.dart';

class _BooksService implements BooksService {
  _BooksService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/books/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<BookModel>>> getBooks(
      {apiKey, country, category}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'q': authorParams,
      'download': downloadParams,
      'api-key': apiKey,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<BookModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    List<BookModel> value = _result.data!['items']
        .map<BookModel>((dynamic i) => BookModel.fromJson(i as Map<String, dynamic>))
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