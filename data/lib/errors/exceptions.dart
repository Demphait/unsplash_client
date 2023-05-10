import 'package:dio/dio.dart';

class ServerException extends DioError {
  ServerException({
    required super.requestOptions,
    super.response,
    super.error,
    required this.detail,
    this.statusCode,
  });

  factory ServerException.fromError(DioError error) {
    return ServerException(
      requestOptions: error.requestOptions,
      response: error.response,
      error: error.error,
      detail: error.response?.data['detail'],
      statusCode: error.response?.data['statusCode'],
    );
  }

  final int? statusCode;
  final String? detail;
}

class NoInternetException extends DioError {
  NoInternetException(RequestOptions requestOptions)
      : super(
    requestOptions: requestOptions,
    response: null,
    error: '',
  );
}
