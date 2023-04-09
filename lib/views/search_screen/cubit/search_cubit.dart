import 'package:bloc/bloc.dart';
import 'package:unsplash_client/api/http_service.dart';
import 'package:unsplash_client/models/photos_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  HttpService httpService = HttpService.instance;

  SearchCubit() : super(EmptySearchState());

  Future<void> searchPhotos(String query) async {
    emit(LoadingSearchState());
    try {
      final response = await httpService.searchingPhotos(query);
      if (response != null && response.isNotEmpty) {
        emit(DataSearchState(response));
      } else if (response == null) {
        emit(ErrorSearchState(httpService.error));
      } else if (response.isEmpty) {
        emit(EmptySearchState());
      }
    } catch (e) {
      emit(ErrorSearchState(e.toString()));
    }
  }
}
