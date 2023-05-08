import 'package:core/utils/strings_utils.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Singleton()
  Dio dio() {
    final baseOptions = BaseOptions(
        baseUrl: StringsUtils.baseUrl,
        contentType: 'application/json',
        headers: {'Authorization': "Client-ID ${StringsUtils.defaultApiKey}"});
    final dio = Dio(baseOptions);
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    return dio;
  }
}
