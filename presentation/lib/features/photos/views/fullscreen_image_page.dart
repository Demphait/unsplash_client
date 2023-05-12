import 'package:auto_route/auto_route.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:presentation/theme/app_colors.dart';

@RoutePage()
class FullScreenImagePage extends StatelessWidget {
  final Photo photo;

  const FullScreenImagePage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent.withOpacity(0.8),
      body: Center(
        child: GestureDetector(
          onVerticalDragDown: context.router.pop,
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: AppColors.transparent),
            maxScale: 4.0,
            imageProvider: NetworkImage(photo.urls.regular),
            heroAttributes: PhotoViewHeroAttributes(tag: photo.urls.small),
          ),
        ),
      ),
    );
  }
}
