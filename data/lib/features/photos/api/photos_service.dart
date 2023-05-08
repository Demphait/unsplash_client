import 'package:dio/dio.dart';
import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:domain/features/photos/models/responses/search_model_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'photos_service.g.dart';

@injectable
@RestApi()
abstract class PhotosService {
  @factoryMethod
  factory PhotosService(Dio dio) = _PhotosService;

  @GET('/photos/random')
  Future<HttpResponse<List<PhotoModelResponse>>> getPhotos(
    @Query('count') int count,
  );

  @GET('/search/photos/')
  Future<HttpResponse<SearchModelResponse>> searchPhoto(
    @Query('query') String query,
    @Query('per_page') int perPage,
  );

  @GET('/photos/')
  Future<HttpResponse<PhotoModelResponse>> getPhoto(
    @Query('id') String id,
  );
}
