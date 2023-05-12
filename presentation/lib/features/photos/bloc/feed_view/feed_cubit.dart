import 'package:bloc/bloc.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:domain/features/photos/usecases/get_photos_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/bloc/cubit_mixin.dart';

part 'feed_cubit.freezed.dart';

part 'feed_state.dart';

@injectable
class FeedCubit extends Cubit<FeedState> with CubitMixin {
  FeedCubit(this._getPhotosUseCase) : super(FeedState.loading());

  final GetPhotosUseCase _getPhotosUseCase;

  Future<void> tryAgain() {
    emit(FeedState.loading());
    return loadPhotos();
  }

  Future<void> loadPhotos() async {
    final result = await invoke(_getPhotosUseCase.getPhotos(5));
    result.fold(
      (failure) => emit(FeedState.error(failure.exception.toString())),
      (photos) {
        state.mapOrNull(
          loading: (state) => emit(
            photos.isEmpty ? FeedState.empty() : FeedState.data(photos),
          ),
          data: (state) => emit(FeedState.data(state.photos + photos)),
        );
      },
    );
  }
}
