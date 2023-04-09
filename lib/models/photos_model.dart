import 'dart:convert';

import 'image_model.dart';

class PhotoModel {
  final ImageModel url;
  final String id;
  final int downloads;
  final int width;
  final int height;
  final int likes;
  final String name;
  PhotoModel({
    required this.url,
    required this.id,
    required this.downloads,
    required this.width,
    required this.height,
    required this.likes,
    required this.name,
  });

  PhotoModel copyWith({
    ImageModel? url,
    String? id,
    int? downloads,
    int? width,
    int? height,
    int? likes,
    String? name,
  }) {
    return PhotoModel(
      url: url ?? this.url,
      id: id ?? this.id,
      downloads: downloads ?? this.downloads,
      width: width ?? this.width,
      height: height ?? this.height,
      likes: likes ?? this.likes,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'urls': url.toMap(),
      'id': id,
      'downloads': downloads,
      'width': width,
      'height': height,
      'likes': likes,
      'user': {'name': name},
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      url: ImageModel.fromMap(
        map['urls'],
      ),
      id: map['id'],
      downloads: map['downloads'],
      width: map['width'],
      height: map['height'],
      likes: map['likes'],
      name: map['user']['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) =>
      PhotoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhotoModel(url: $url, id: $id, downloads: $downloads, width: $width, height: $height, likes: $likes, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoModel &&
        other.url == url &&
        other.id == id &&
        other.downloads == downloads &&
        other.width == width &&
        other.height == height &&
        other.likes == likes &&
        other.name == name;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        id.hashCode ^
        downloads.hashCode ^
        width.hashCode ^
        height.hashCode ^
        likes.hashCode ^
        name.hashCode;
  }
}
