import 'package:json_annotation/json_annotation.dart';

part 'image_model_response.g.dart';

@JsonSerializable(createToJson: false)
class ImageModelResponse {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  ImageModelResponse({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory ImageModelResponse.fromJson(Map<String, dynamic> json) {
    return _$ImageModelResponseFromJson(json);
  }
}
