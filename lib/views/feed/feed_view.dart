import 'package:flutter/material.dart';
import 'package:unsplash_client/views/feed/widgets/photo_item.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  String imageUrl =
      'https://images.unsplash.com/photo-1680849219172-71e4f632b282?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3174&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return PhotoItem(photo: imageUrl);
        },
      ),
    );
  }
}
