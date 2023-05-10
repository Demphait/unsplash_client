import 'package:auto_route/auto_route.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

@RoutePage()
class FullScreenImagePage extends StatelessWidget {
  final Photo photo;

  const FullScreenImagePage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: context.router.pop,
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
