import 'package:bloc/bloc.dart';
import 'package:core/utils/data_state.dart';
import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit(this._photosRepository) : super(LoadingFeedState());

  final PhotosRepository _photosRepository;

  Future<void> refreshPhotos() => _fetchPhotos(true);

  Future<void> loadPhotos() => _fetchPhotos(false);

  Future<void> _fetchPhotos(bool isForceNew) async {
    final response = await _photosRepository.getPhotos(30);
    if (response is DataSuccess) {
      final data = response.data;
      if (data!.isEmpty) {
        emit(EmptyFeedState());
      } else if (state is DataFeedState && !isForceNew) {
        var dataState = state as DataFeedState;
        emit(DataFeedState(dataState.photos..addAll(data)));
      } else {
        emit(DataFeedState(data));
      }
    } else if (response is DataFailed) {
      emit(ErrorFeedState(response.error.toString()));
    }
  }
}
