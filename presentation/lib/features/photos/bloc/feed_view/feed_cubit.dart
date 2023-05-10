import 'package:bloc/bloc.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:domain/features/photos/usecases/get_photos_usecase.dart';
import 'package:injectable/injectable.dart';

part 'feed_state.dart';

@injectable
class FeedCubit extends Cubit<FeedState> {
  FeedCubit(this._getPhotosUseCase) : super(LoadingFeedState());

  final GetPhotosUseCase _getPhotosUseCase;

  Future<void> tryAgainFunc() {
    emit(LoadingFeedState());
    return _fetchPhotos(true);
  }

  Future<void> refreshPhotos() => _fetchPhotos(true);

  Future<void> loadPhotos() => _fetchPhotos(false);

  Future<void> _fetchPhotos(bool isForceNew) async {
    final response = await _getPhotosUseCase.getPhotos(30);
    final result = response.fold(
      (failure) => failure,
      (photos) => photos,
    );
    if (result is List<Photo>) {
      if (result.isEmpty) {
        emit(EmptyFeedState());
      } else if (state is DataFeedState && !isForceNew) {
        var dataState = state as DataFeedState;
        emit(DataFeedState(dataState.photos..addAll(result)));
      } else {
        emit(DataFeedState(result));
      }
    } else if (result is Failure &&
        (result is NoInternetConnectionFailure || result is ServerFailure)) {
      emit(ErrorFeedState(result.exception.toString()));
    }
  }
}
