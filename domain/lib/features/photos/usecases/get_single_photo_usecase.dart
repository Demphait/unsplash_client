import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSinglePhotoUseCase {
  GetSinglePhotoUseCase(this._photosRepository);

  final PhotosRepository _photosRepository;

  Future<Either<Failure, Photo>> getPhoto(String id) async {
    return _photosRepository.getPhoto(id);
  }
}
