import 'package:dio/dio.dart';
import 'package:unsplash_client/models/photos_model.dart';

class HttpService {
  static HttpService? _instance;
  static HttpService get instance => _instance ??= HttpService();

  HttpService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.unsplash.com',
        queryParameters: {
          'client_id': 'nqxrE5-xFCBxRPQtij4x1bqh7445CA6ooZ435cA3wHc'
        },
      ),
    );
  }

  late Dio dio;
  var error = '';

  Future<List<PhotoModel>?> fetchPhotos() async {
    try {
      Response response =
          await dio.get('/photos/random', queryParameters: {'count': 30});
      List<dynamic> photosMap = response.data;

      List<PhotoModel> photos =
          photosMap.map((e) => PhotoModel.fromMap(e)).toList();
      return photos;
    } on DioError catch (e) {
      error = '$e';
      return null;
    }
  }
}
