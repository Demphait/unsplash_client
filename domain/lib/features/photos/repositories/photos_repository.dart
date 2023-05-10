import 'package:dartz/dartz.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:core/utils/data_state.dart';
import 'package:domain/features/photos/entities/search.dart';


import '../../../errors/failures.dart';



abstract class PhotosRepository {
  Future<Either<Failure, List<Photo>>> getPhotos(int count);

  Future<Either<Failure, Search>> searchPhoto(String query, int perPage);

  Future<Either<Failure, Photo>> getPhoto(String id);
}