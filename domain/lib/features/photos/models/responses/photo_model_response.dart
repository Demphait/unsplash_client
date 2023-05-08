import 'package:domain/features/photos/models/responses/user_model_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image_model_response.dart';

part 'photo_model_response.g.dart';

@JsonSerializable(createToJson: false)
class PhotoModelResponse {
  final ImageModelResponse urls;
  final String id;
  final int width;
  final int height;
  final int likes;
  final UserModelResponse user;

  PhotoModelResponse({
    required this.urls,
    required this.id,
    required this.width,
    required this.height,
    required this.likes,
    required this.user,
  });

  factory PhotoModelResponse.fromJson(Map<String, dynamic> json) {
    return _$PhotoModelResponseFromJson(json);
  }
}
