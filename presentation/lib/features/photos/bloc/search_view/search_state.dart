part of 'search_cubit.dart';

abstract class SearchState {}

class EmptySearchState extends SearchState {}

class LoadingSearchState extends SearchState {}

class ErrorSearchState extends SearchState {
  final String error;
  ErrorSearchState(this.error);
}

class DataSearchState extends SearchState {
  final List<PhotoModelResponse> photos;
  DataSearchState(this.photos);
}
