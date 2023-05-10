import 'package:data/features/photos/models/remote_models/photo_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_remote_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SearchRemoteModel {
  final int total;
  final int totalPages;
  final List<PhotoRemoteModel> results;

  SearchRemoteModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchRemoteModel.fromJson(Map<String, dynamic> json) {
    return _$SearchRemoteModelFromJson(json);
  }
}