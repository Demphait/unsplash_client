import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SearchModelResponse {
  final int total;
  final int totalPages;
  final List<PhotoModelResponse> results;

  SearchModelResponse({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchModelResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchModelResponseFromJson(json);
  }
}