import 'package:domain/features/photos/entities/photo.dart';

class Search {
  final int total;
  final int totalPages;
  final List<Photo> results;

  Search({
    required this.total,
    required this.totalPages,
    required this.results,
  });
}