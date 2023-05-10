import 'package:data/features/photos/models/remote_models/photo_remote_model.dart';
import 'package:data/features/photos/models/remote_models/search_remote_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../api/photos_service.dart';

abstract class PhotosRemoteDataSource {
  Future<List<PhotoRemoteModel>> getPhotos(int count);

  Future<SearchRemoteModel> searchPhoto(String query, int perPage);

  Future<PhotoRemoteModel> getPhoto(String id);
}

@Singleton(as: PhotosRemoteDataSource)
class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource {
  final PhotosService _photosService;

  PhotosRemoteDataSourceImpl(this._photosService);

  @override
  Future<List<PhotoRemoteModel>> getPhotos(int count) {
    return _photosService.getPhotos(count);
  }

  @override
  Future<SearchRemoteModel> searchPhoto(String query, int perPage) {
    return _photosService.searchPhoto(query, perPage);
  }

  @override
  Future<PhotoRemoteModel> getPhoto(String id) {
    return _photosService.getPhoto(id);
  }
}
