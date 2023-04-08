import 'package:flutter/material.dart';
import 'package:unsplash_client/api/http_service.dart';
import 'package:unsplash_client/models/photos_model.dart';
import 'package:unsplash_client/views/feed/widgets/photo_item.dart';
import 'package:unsplash_client/widgets/app_loader.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: HttpService.instance.fetchPhotos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PhotoModel>?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<PhotoModel> photoModels = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: photoModels.length,
              itemBuilder: (BuildContext context, int index) {
                return PhotoItem(photo: photoModels[index]);
              },
            );
          } else {
            return HttpService.instance.error.isEmpty
                ? Center(child: AppLoader())
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(HttpService.instance.error),
                        TextButton(
                          onPressed: () {
                            HttpService.instance.fetchPhotos();
                            setState(() {});
                          },
                          child: const Text('Try again'),
                        ),
                      ],
                    ),
                  );
          }
        },
      ),
    );
  }
}
