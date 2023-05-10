import 'package:json_annotation/json_annotation.dart';

part 'user_remote_model.g.dart';

@JsonSerializable(createToJson: false)
class UserRemoteModel {
  final String id;
  final String username;
  final String name;

  UserRemoteModel({
    required this.id,
    required this.username,
    required this.name,
  });

  factory UserRemoteModel.fromJson(Map<String, dynamic> json) {
    return _$UserRemoteModelFromJson(json);
  }
}