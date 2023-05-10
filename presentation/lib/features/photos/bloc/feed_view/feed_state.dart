part of 'feed_cubit.dart';

abstract class FeedState {}

class EmptyFeedState extends FeedState {}

class LoadingFeedState extends FeedState {}

class ErrorFeedState extends FeedState {
  final String error;
  ErrorFeedState(this.error);
}

class DataFeedState extends FeedState {
  final List<Photo> photos;
  DataFeedState(this.photos);
}
