import 'package:flutter/material.dart';
import 'package:unsplash_client/styles/app_colors.dart';
import 'package:unsplash_client/styles/app_space.dart';
import 'package:unsplash_client/styles/app_text_styles.dart';
import 'package:unsplash_client/views/detailed_screen/fullscreen_image_view.dart';
import 'package:unsplash_client/views/detailed_screen/screen_arguments.dart';

class DetailedView extends StatefulWidget {
  const DetailedView({super.key});

  static const routeName = '/detailed';

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo: ${args.photo.id}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: args.photo.url.small,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) =>
                          FullScreenImageView(photo: args.photo),
                    ),
                  );
                },
                child: InteractiveViewer(
                  maxScale: 4.0,
                  child: Image.network(
                    args.photo.url.regular,
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
                    '${args.photo.width}X${args.photo.height}',
                    Icons.wallpaper_rounded,
                  ),
                  textBuild(
                    'Likes',
                    args.photo.likes.toString(),
                    Icons.favorite_outline,
                  ),
                  textBuild(
                    'Downloads',
                    args.photo.downloads.toString(),
                    Icons.file_download_outlined,
                  ),
                  textBuild(
                    'Author',
                    args.photo.name,
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
