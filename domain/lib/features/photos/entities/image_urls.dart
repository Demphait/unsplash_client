import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_urls.freezed.dart';

@freezed
class ImageUrls with _$ImageUrls {
  const factory ImageUrls({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
  }) = _ImageUrls;
}
