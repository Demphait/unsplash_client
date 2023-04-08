part of 'feed_cubit.dart';

abstract class FeedState {}

class EmptyFeedState extends FeedState {} // server responses but empty response

class LoadingFeedState extends FeedState {}

class ErrorFeedState extends FeedState {
  final String error;
  ErrorFeedState(this.error);
}

class DataFeedState extends FeedState {
  final List<PhotoModel> photos;
  DataFeedState(this.photos);
}
