import 'package:data/features/photos/models/remote_models/image_remote_model.dart';
import 'package:data/features/photos/models/remote_models/photo_remote_model.dart';
import 'package:data/features/photos/models/remote_models/search_remote_model.dart';
import 'package:data/features/photos/models/remote_models/user_remote_model.dart';
import 'package:domain/features/photos/entities/image_urls.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:domain/features/photos/entities/search.dart';
import 'package:domain/features/photos/entities/user.dart';

extension ImageRemoteModelExtension on ImageRemoteModel {
  ImageUrls toEntity() {
    return ImageUrls(
      raw: raw,
      full: full,
      regular: regular,
      small: small,
      thumb: thumb,
    );
  }
}

extension SearchRemoteModelExtension on SearchRemoteModel {
  Search toEntity() {
    return Search(
      total: total,
      totalPages: totalPages,
      results: results.map((element) => element.toEntity()).toList(),
    );
  }
}

extension PhotoRemoteModelExtension on PhotoRemoteModel {
  Photo toEntity() {
    return Photo(
      urls: urls.toEntity(),
      id: id,
      width: width,
      height: height,
      likes: likes,
      user: user.toEntity(),
    );
  }
}

extension UserRemoteModelExtenstion on UserRemoteModel {
  User toEntity() {
    return User(
      id: id,
      username: username,
      name: name,
    );
  }
}
