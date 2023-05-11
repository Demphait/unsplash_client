import 'package:data/features/photos/models/remote_models/image_remote_model.dart';
import 'package:data/features/photos/models/remote_models/user_remote_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_remote_model.freezed.dart';

part 'photo_remote_model.g.dart';

@freezed
class PhotoRemoteModel with _$PhotoRemoteModel {
  const factory PhotoRemoteModel({
    required ImageRemoteModel urls,
    required String id,
    required int width,
    required int height,
    required int likes,
    required UserRemoteModel user,
  }) = _PhotoRemoteModel;

  factory PhotoRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoRemoteModelFromJson(json);
}
