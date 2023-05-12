part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.empty() = _Initial;

  const factory SearchState.loading() = _Loading;

  const factory SearchState.error(String error) = _Error;

  const factory SearchState.data(List<Photo> photos) = _Data;
}
