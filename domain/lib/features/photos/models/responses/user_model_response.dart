import 'package:json_annotation/json_annotation.dart';

part 'user_model_response.g.dart';

@JsonSerializable(createToJson: false)
class UserModelResponse {
  final String id;
  final String username;
  final String name;

  UserModelResponse({
    required this.id,
    required this.username,
    required this.name,
  });

  factory UserModelResponse.fromJson(Map<String, dynamic> json) {
    return _$UserModelResponseFromJson(json);
  }
}