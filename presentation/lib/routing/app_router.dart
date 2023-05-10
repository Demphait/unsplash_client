import 'package:auto_route/auto_route.dart';
import 'package:domain/features/photos/entities/photo.dart';
import 'package:presentation/features/photos/views/fullscreen_image_page.dart';

import '../features/photos/views/detailed_page.dart';
import '../features/photos/views/feed_page.dart';
import '../features/photos/views/search_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DetailedRoute.page),
        AutoRoute(page: FeedRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: FullRouteImageRoute.page),
      ];
}
