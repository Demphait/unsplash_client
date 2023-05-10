import 'package:dartz/dartz.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failures.dart';
import '../entities/search.dart';

@injectable
class SearchPhotosUseCase {
  SearchPhotosUseCase(this._photosRepository);

  final PhotosRepository _photosRepository;

  Future<Either<Failure, Search>> searchPhotos(String query, int perPage) async {
    return _photosRepository.searchPhoto(query, perPage);
  }
}
