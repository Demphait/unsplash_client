import 'package:bloc/bloc.dart';
import 'package:core/utils/data_state.dart';
import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._photosRepository) : super(EmptySearchState());

  final PhotosRepository _photosRepository;

  Future<void> searchPhotos(String query) async {
    emit(LoadingSearchState());
    final response = await _photosRepository.searchPhoto(query, 5);
    if (response is DataSuccess) {
      final data = response.data!.results;
      if (data.isNotEmpty) {
        emit(DataSearchState(data));
      } else if (data.isEmpty) {
        emit(EmptySearchState());
      }
    } else if (response is DataFailed) {
      emit(ErrorSearchState(response.error.toString()));
    }
  }
}
