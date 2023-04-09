import 'dart:convert';

class ImageModel {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  ImageModel({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  ImageModel copyWith({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
  }) {
    return ImageModel(
      raw: raw ?? this.raw,
      full: full ?? this.full,
      regular: regular ?? this.regular,
      small: small ?? this.small,
      thumb: thumb ?? this.thumb,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'raw': raw,
      'full': full,
      'regular': regular,
      'small': small,
      'thumb': thumb,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      raw: map['raw'],
      full: map['full'],
      regular: map['regular'],
      small: map['small'],
      thumb: map['thumb'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImageModel(raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel &&
        other.raw == raw &&
        other.full == full &&
        other.regular == regular &&
        other.small == small &&
        other.thumb == thumb;
  }

  @override
  int get hashCode {
    return raw.hashCode ^
        full.hashCode ^
        regular.hashCode ^
        small.hashCode ^
        thumb.hashCode;
  }
}
