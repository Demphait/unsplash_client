import 'package:flutter/material.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/theme/app_theme.dart';

import 'features/photos/views/detailed_page.dart';
import 'features/photos/views/feed_page.dart';
import 'features/photos/views/search_page.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Unsplash client',
      // theme:
      //     ThemeData(useMaterial3: true, colorScheme: AppTheme.lightColorScheme),
      // darkTheme:
      //     ThemeData(useMaterial3: true, colorScheme: AppTheme.darkColorScheme),
    );
  }
}
