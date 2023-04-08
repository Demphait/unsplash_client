import 'package:bloc/bloc.dart';
import 'package:unsplash_client/api/http_service.dart';
import 'package:unsplash_client/models/photos_model.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final HttpService httpService;
  bool isLoadingMore = false;
  FeedCubit(this.httpService) : super(EmptyFeedState());

  Future<void> fetchPhotos() async {
    emit(LoadingFeedState());
    try {
      final response = await httpService.fetchPhotos();
      if (response != null) {
        emit(DataFeedState(response));
      } else if (response == null) {
        emit(ErrorFeedState(httpService.error));
      } else if (response.isEmpty) {
        emit(EmptyFeedState());
      }
    } catch (e) {
      emit(ErrorFeedState(e.toString()));
    }
  }

  Future<void> refreshPhotos() async {
    try {
      final response = await httpService.fetchPhotos();
      if (response != null) {
        emit(DataFeedState(response));
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
