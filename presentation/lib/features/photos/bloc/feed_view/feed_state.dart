part of 'feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.empty() = _Empty;

  const factory FeedState.loading() = _Loading;

  const factory FeedState.error(String error) = _Error;

  const factory FeedState.data(List<Photo> photos) = _Data;
}
