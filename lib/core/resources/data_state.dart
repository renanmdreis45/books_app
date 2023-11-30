import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSucess<T> extends DataState {
  const DataSucess(T data) : super(data: data);
}

class DataError<T> extends DataState {
  const DataError(DioException error) : super(error: error);
}
