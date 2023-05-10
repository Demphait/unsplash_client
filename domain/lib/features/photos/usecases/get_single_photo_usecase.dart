import 'package:dartz/dartz.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failures.dart';
import '../entities/photo.dart';

@injectable
class GetSinglePhotoUseCase {
  GetSinglePhotoUseCase(this._photosRepository);

  final PhotosRepository _photosRepository;

  Future<Either<Failure, Photo>> getPhoto(String id) async {
    return _photosRepository.getPhoto(id);
  }
}
