import 'package:data/features/photos/models/remote_models/photo_remote_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_remote_model.freezed.dart';

part 'search_remote_model.g.dart';

@Freezed(toJson: false)
class SearchRemoteModel with _$SearchRemoteModel {
  const factory SearchRemoteModel({
    required int total,
    @JsonKey(name: 'total_pages') required int totalPages,
    required List<PhotoRemoteModel> results,
  }) = _SearchRemoteModel;

  factory SearchRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRemoteModelFromJson(json);
}
