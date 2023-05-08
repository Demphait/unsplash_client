import 'package:auto_route/auto_route.dart';
import 'package:domain/features/photos/models/responses/photo_model_response.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_space.dart';
import '../../../theme/text_style_extension.dart';
import '../views/detailed_view.dart';
import '../views/screen_arguments.dart';

class PhotoItem extends StatelessWidget {
  final PhotoModelResponse photo;

  const PhotoItem({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Flexible(
                  child: Hero(
                    tag: photo.urls.small,
                    child: Image.network(
                      photo.urls.regular,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppSpace.smd),
                  width: double.infinity,
                  color: AppColors.primary,
                  alignment: Alignment.center,
                  child: Text(
                    'Author: ${photo.user.name}',
                    style: AppTextStyles.primaryTextStyle.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: () {
                  // context.router.push(DetailedView());
                  Navigator.pushNamed(
                    context,
                    DetailedView.routeName,
                    arguments: ScreenArguments(photo: photo),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
