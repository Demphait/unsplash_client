import 'package:flutter/material.dart';
import 'package:unsplash_client/models/photos_model.dart';
import 'package:unsplash_client/styles/app_colors.dart';

class FullScreenImageView extends StatelessWidget {
  final PhotoModel photo;

  const FullScreenImageView({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: Navigator.of(context).pop,
      key: ValueKey(photo.id),
      direction: DismissDirection.vertical,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: InteractiveViewer(
            clipBehavior: Clip.none,
            maxScale: 4.0,
            child: Image.network(
              photo.url.regular,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
