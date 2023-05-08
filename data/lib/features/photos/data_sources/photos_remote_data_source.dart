import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:domain/features/photos/models/responses/search_model_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../api/photos_service.dart';

abstract class PhotosRemoteDataSource {
  Future<HttpResponse<List<PhotoModelResponse>>> getPhotos(int count);

  Future<HttpResponse<SearchModelResponse>> searchPhoto(String query, int perPage);

  Future<HttpResponse<PhotoModelResponse>> getPhoto(String id);
}

@Singleton(as: PhotosRemoteDataSource)
class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource {
  final PhotosService _photosService;

  PhotosRemoteDataSourceImpl(this._photosService);

  @override
  Future<HttpResponse<List<PhotoModelResponse>>> getPhotos(int count) {
    return _photosService.getPhotos(count);
  }

  @override
  Future<HttpResponse<SearchModelResponse>> searchPhoto(String query, int perPage) {
    return _photosService.searchPhoto(query, perPage);
  }

  @override
  Future<HttpResponse<PhotoModelResponse>> getPhoto(String id) {
    return _photosService.getPhoto(id);
  }
}
