import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:core/utils/data_state.dart';

import '../models/responses/search_model_response.dart';

abstract class PhotosRepository {
  Future<DataState<List<PhotoModelResponse>>> getPhotos(int count);

  Future<DataState<SearchModelResponse>> searchPhoto(String query, int perPage);

  Future<DataState<PhotoModelResponse>> getPhoto(String id);
}