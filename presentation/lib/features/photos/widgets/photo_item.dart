import 'package:domain/features/photos/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_space.dart';
import 'package:presentation/theme/text_style_extension.dart';



class PhotoItem extends StatelessWidget {
  final Photo photo;
  final VoidCallback onTap;

  const PhotoItem({required this.photo, super.key, required this.onTap});

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
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
