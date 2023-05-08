import 'package:flutter/material.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/theme/app_theme.dart';

import 'features/photos/views/detailed_view.dart';
import 'features/photos/views/feed_view.dart';
import 'features/photos/views/search_view.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Unsplash client',
    theme: ThemeData(useMaterial3: true, colorScheme: AppTheme.lightColorScheme),
    darkTheme: ThemeData(useMaterial3: true, colorScheme: AppTheme.darkColorScheme),
    initialRoute: '/',
    routes: {
      '/': (context) => const FeedView(),
      DetailedView.routeName: (context) => const DetailedView(),
      SearchView.routeName: (context) => const SearchView(),
    },
  );
}
}
