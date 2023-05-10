import 'dart:io';

import 'package:data/errors/exceptions.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final statusCode = response?.statusCode;

    if (response == null || err is SocketException) {
      handler.reject(NoInternetException(err.requestOptions));
    } else if (statusCode != null && statusCode >= 300) {
      handler.reject(ServerException.fromError(err));
    } else {
      handler.next(err);
    }
  }
}
