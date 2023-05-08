import 'dart:io' show HttpStatus;
import 'package:core/utils/data_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

mixin RepositoryMixin {
  Future<DataState<List<T>>> invokeList<T>(
      Future<HttpResponse<List<T>>> Function() request) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch (error) {
      return DataFailed(error);
    }
  }

  Future<DataState<T>> invoke<T>(
      Future<HttpResponse<T>> Function() request) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch (error) {
      return DataFailed(error);
    }
  }
}
