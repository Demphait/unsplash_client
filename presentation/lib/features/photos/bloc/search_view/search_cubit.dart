import 'package:bloc/bloc.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/features/photos/usecases/search_photos_usecase.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchPhotosUseCase) : super(EmptySearchState());

  final SearchPhotosUseCase _searchPhotosUseCase;

  Future<void> searchPhotos(String query) async {
    emit(LoadingSearchState());
    final response = await _searchPhotosUseCase.searchPhotos(query, 5);
    final result = response.fold(
          (failure) => failure,
          (photos) => photos.results,
    );
    if (result is List<Photo>) {
      if (result.isEmpty) {
        emit(EmptySearchState());
      } else if (result.isNotEmpty) {
        emit(DataSearchState(result));
      }
    } else if (result is Failure &&
        (result is NoInternetConnectionFailure || result is ServerFailure)) {
      emit(ErrorSearchState(result.exception.toString()));
    }
  }
}