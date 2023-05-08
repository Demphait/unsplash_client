import 'package:core/utils/data_state.dart';
import 'package:data/features/photos/data_sources/photos_remote_data_source.dart';
import 'package:data/utils/repository_mixin.dart';
import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:domain/features/photos/models/responses/search_model_response.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PhotosRepository)
class PhotosRepositoryImpl with RepositoryMixin implements PhotosRepository {
  PhotosRepositoryImpl(this._remoteDataSource);

  final PhotosRemoteDataSource _remoteDataSource;

  @override
  Future<DataState<List<PhotoModelResponse>>> getPhotos(int count) {
    // return invokeList(() => _remoteDataSource.getPhotos(count));
    return invokeList<PhotoModelResponse>(() => _remoteDataSource.getPhotos(count));
  }

  @override
  Future<DataState<SearchModelResponse>> searchPhoto(
    String query,
    int perPage,
  ) {
    return invoke(() => _remoteDataSource.searchPhoto(query, perPage));
  }

  @override
  Future<DataState<PhotoModelResponse>> getPhoto(String id) {
    return invoke(() => _remoteDataSource.getPhoto(id));
  }
}
