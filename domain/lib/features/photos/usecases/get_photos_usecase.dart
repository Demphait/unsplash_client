import 'package:dartz/dartz.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failures.dart';
import '../entities/photo.dart';

@injectable
class GetPhotosUseCase {
  GetPhotosUseCase(this._photosRepository);

  final PhotosRepository _photosRepository;

  Future<Either<Failure, List<Photo>>> getPhotos(int count) async {
    return _photosRepository.getPhotos(count);
  }
}
