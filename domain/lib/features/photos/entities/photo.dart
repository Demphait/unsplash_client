import 'package:domain/features/photos/entities/image_urls.dart';
import 'package:domain/features/photos/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required ImageUrls urls,
    required String id,
    required int width,
    required int height,
    required int likes,
    required User user,
  }) = _Photo;
}
