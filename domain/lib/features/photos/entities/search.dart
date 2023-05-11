import 'package:domain/features/photos/entities/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

@freezed
class Search with _$Search {
  const factory Search({
    required int total,
    required int totalPages,
    required List<Photo> results,
  }) = _Search;
}
