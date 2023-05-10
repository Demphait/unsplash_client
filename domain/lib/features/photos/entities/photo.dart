import 'package:domain/features/photos/entities/image_urls.dart';
import 'package:domain/features/photos/entities/user.dart';

class Photo {
  final ImageUrls urls;
  final String id;
  final int width;
  final int height;
  final int likes;
  final User user;

  Photo({
    required this.urls,
    required this.id,
    required this.width,
    required this.height,
    required this.likes,
    required this.user,
  });
}
