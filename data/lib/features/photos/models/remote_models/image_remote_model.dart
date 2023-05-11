import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_remote_model.freezed.dart';

part 'image_remote_model.g.dart';

@freezed
class ImageRemoteModel with _$ImageRemoteModel {
  const factory ImageRemoteModel({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
  }) = _ImageRemoteModel;

  factory ImageRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$ImageRemoteModelFromJson(json);
}
