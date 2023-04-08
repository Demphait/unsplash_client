import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_client/views/feed/cubit/feed_cubit.dart';
import 'package:unsplash_client/views/feed/widgets/photo_item.dart';
import 'package:unsplash_client/widgets/app_loader.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  final _listController = ScrollController();
  final FeedCubit _cubit = FeedCubit();

  Future<void> _scrollListener() async {
    if (_cubit.isLoadingMore) return;
    if (_listController.position.pixels ==
        _listController.position.maxScrollExtent) {
      print('call');
      _cubit.isLoadingMore = true;
      await _cubit.loadPhotos();
      _cubit.isLoadingMore = false;
    }
  }

  @override
  void initState() {
    _listController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..loadPhotos(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
          centerTitle: true,
        ),
        body: BlocBuilder<FeedCubit, FeedState>(
          builder: (context, state) {
            if (state is LoadingFeedState) {
              return AppLoader();
            } else if (state is DataFeedState) {
              return RefreshIndicator(
                onRefresh: _cubit.refreshPhotos,
                child: ListView.builder(
                  controller: _listController,
                  itemCount: state.photos.length,
                  itemBuilder: (context, index) {
                    return PhotoItem(photo: state.photos[index]);
                  },
                ),
              );
            } else if (state is ErrorFeedState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  ElevatedButton(
                    onPressed: () {
                      _cubit.loadPhotos();
                    },
                    child: const Text('Try again'),
                  ),
                ],
              );
            } else if (state is EmptyFeedState) {
              return const Center(
                child: Text('Empty'),
              );
            }
            return Center(
              child: Text(state.toString()),
            );
          },
        ),
      ),
    );
  }
}
