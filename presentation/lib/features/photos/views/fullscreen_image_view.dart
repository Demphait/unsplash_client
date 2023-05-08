import 'package:auto_route/auto_route.dart';
import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

@RoutePage()
class FullScreenImageView extends StatelessWidget {
  final PhotoModelResponse photo;

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
              photo.urls.regular,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}