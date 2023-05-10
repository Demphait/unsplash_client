import 'package:core/utils/data_state.dart';
import 'package:dartz/dartz.dart';
import 'package:data/features/photos/data_sources/photos_remote_data_source.dart';
import 'package:data/features/photos/models/mappers.dart';
import 'package:data/features/photos/models/remote_models/photo_remote_model.dart';
import 'package:data/utils/repository_mixin.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:domain/features/photos/entities/search.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PhotosRepository)
class PhotosRepositoryImpl with RepositoryMixin implements PhotosRepository {
  PhotosRepositoryImpl(this._remoteDataSource);

  final PhotosRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Photo>>> getPhotos(int count) {
    return invoke(() {
      return _remoteDataSource.getPhotos(count).then((photos) {
        return photos.map((element) => element.toEntity()).toList();
      });
    });
  }

  @override
  Future<Either<Failure, Search>> searchPhoto(
    String query,
    int perPage,
  ) {
    return invoke(() {
       return _remoteDataSource.searchPhoto(query, perPage).then((search) {
        return search.toEntity();
      });
    });
  }

  @override
  Future<Either<Failure, Photo>> getPhoto(String id) {
    return invoke(() {
      return _remoteDataSource.getPhoto(id).then((photo) {
        return photo.toEntity();
      });
    });
  }
}
