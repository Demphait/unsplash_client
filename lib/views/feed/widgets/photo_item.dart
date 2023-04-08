import 'package:flutter/material.dart';
import 'package:unsplash_client/models/photos_model.dart';
import 'package:unsplash_client/styles/app_colors.dart';
import 'package:unsplash_client/styles/app_text_styles.dart';
import 'package:unsplash_client/views/detailed_screen/detailed_view.dart';
import 'package:unsplash_client/views/detailed_screen/screen_arguments.dart';

class PhotoItem extends StatelessWidget {
  final PhotoModel photo;

  const PhotoItem({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Flexible(
                    child: Hero(
                      tag: photo.url.small,
                      child: Image.network(
                        photo.url.regular,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(11),
                    width: double.infinity,
                    color: AppColors.primary,
                    alignment: Alignment.center,
                    child: Text(
                      'Author: ${photo.name}',
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
      ),
    );
  }
}
