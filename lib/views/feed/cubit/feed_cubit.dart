import 'package:bloc/bloc.dart';
import 'package:unsplash_client/api/http_service.dart';
import 'package:unsplash_client/models/photos_model.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  HttpService httpService = HttpService.instance;
  bool isLoadingMore = false;
  FeedCubit() : super(LoadingFeedState());

  Future<void> refreshPhotos() => _fetchPhotos(true);

  Future<void> loadPhotos() => _fetchPhotos(false);

  Future<void> _fetchPhotos(bool isForceNew) async {
    try {
      final response = await httpService.fetchPhotos();
      if (response != null) {
        if (state is DataFeedState && !isForceNew) {
          var dataState = state as DataFeedState;
          emit(DataFeedState(dataState.photos..addAll(response)));
        } else {
          emit(DataFeedState(response));
        }
      } else if (response == null) {
        emit(ErrorFeedState(httpService.error));
      } else if (response.isEmpty) {
        emit(EmptyFeedState());
      }
    } catch (e) {
      emit(ErrorFeedState(e.toString()));
    }
  }
}
