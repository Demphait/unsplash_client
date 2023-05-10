import 'package:data/features/photos/models/remote_models/image_remote_model.dart';
import 'package:data/features/photos/models/remote_models/user_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_remote_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoRemoteModel {
  final ImageRemoteModel urls;
  final String id;
  final int width;
  final int height;
  final int likes;
  final UserRemoteModel user;

  PhotoRemoteModel({
    required this.urls,
    required this.id,
    required this.width,
    required this.height,
    required this.likes,
    required this.user,
  });

  factory PhotoRemoteModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoRemoteModelFromJson(json);
  }
}
