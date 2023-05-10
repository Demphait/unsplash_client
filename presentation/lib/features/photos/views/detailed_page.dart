import 'package:auto_route/auto_route.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:flutter/material.dart';

import '../../../routing/app_router.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_space.dart';
import '../../../theme/text_style_extension.dart';

@RoutePage()
class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key, required this.photo});

  final Photo photo;

  static const routeName = '/detailed';

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    final photo = widget.photo;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo: ${photo.id}',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: photo.urls.small,
              child: GestureDetector(
                onTap: () {
                  context.router
                      .push(FullRouteImageRoute(photo: photo)); // TODO later
                  // Navigator.of(context).push(
                  //   PageRouteBuilder(
                  //     opaque: false,
                  //     pageBuilder: (_, __, ___) =>
                  //         FullScreenImagePage(photo: photo),
                  //   ),
                  // );
                },
                child: InteractiveViewer(
                  maxScale: 4.0,
                  child: Image.network(
                    photo.urls.regular,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress != null) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              value: loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!,
                            ),
                          ),
                        );
                      }
                      return child;
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  AppSpace.md, AppSpace.sm, AppSpace.md, AppSpace.md),
              child: Column(
                children: [
                  textBuild(
                    'Resolution',
                    '${photo.width}X${photo.height}',
                    Icons.wallpaper_rounded,
                  ),
                  textBuild(
                    'Likes',
                    photo.likes.toString(),
                    Icons.favorite_outline,
                  ),
                  textBuild(
                    'Author',
                    photo.user.name,
                    Icons.person_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textBuild(String name, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
      child: Row(
        children: [
          Text(
            name,
            style: AppTextStyles.primaryTextStyle.black,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: AppTextStyles.primaryTextStyle.black,
              ),
            ),
          ),
          Icon(
            icon,
            color: AppColors.black,
            size: 22,
          )
        ],
      ),
    );
  }
}
