import 'package:json_annotation/json_annotation.dart';

part 'image_remote_model.g.dart';

@JsonSerializable(createToJson: false)
class ImageRemoteModel {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  ImageRemoteModel({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory ImageRemoteModel.fromJson(Map<String, dynamic> json) {
    return _$ImageRemoteModelFromJson(json);
  }
}
