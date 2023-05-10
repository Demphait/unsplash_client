import 'package:data/features/photos/models/remote_models/photo_remote_model.dart';
import 'package:data/features/photos/models/remote_models/search_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'photos_service.g.dart';

@injectable
@RestApi()
abstract class PhotosService {
  @factoryMethod
  factory PhotosService(Dio dio) = _PhotosService;

  @GET('/photos/random')
  Future<List<PhotoRemoteModel>> getPhotos(
    @Query('count') int count,
  );

  @GET('/search/photos/')
  Future<SearchRemoteModel> searchPhoto(
    @Query('query') String query,
    @Query('per_page') int perPage,
  );

  @GET('/photos/')
  Future<PhotoRemoteModel> getPhoto(
    @Query('id') String id,
  );
}
