import 'package:flutter/material.dart';
import 'package:unsplash_client/views/detailed_screen/detailed_view.dart';
import 'package:unsplash_client/views/feed/feed_view.dart';
import 'package:unsplash_client/views/search_screen/search_view.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash client',
      initialRoute: '/',
      routes: {
        '/': (context) => const FeedView(),
        DetailedView.routeName: (context) => const DetailedView(),
        SearchView.routeName: (context) => const SearchView(),
      },
    );
  }
}
