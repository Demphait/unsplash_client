import 'package:bloc/bloc.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/features/photos/usecases/search_photos_usecase.dart';
import 'package:presentation/bloc/cubit_mixin.dart';

part 'search_cubit.freezed.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> with CubitMixin {
  SearchCubit(this._searchPhotosUseCase) : super(SearchState.empty());

  final SearchPhotosUseCase _searchPhotosUseCase;

  Future<void> searchPhotos(String query) async {
    emit(SearchState.loading());
    final result = await invoke(_searchPhotosUseCase.searchPhotos(query, 5));
    result.fold(
        (failure) => emit(SearchState.error(failure.exception.toString())),
        (photos) {
      if (photos.results.isEmpty) {
        emit(const SearchState.empty());
        return;
      }
      emit(SearchState.data(photos.results));
    });
  }
}
