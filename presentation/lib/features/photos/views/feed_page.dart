import 'package:auto_route/auto_route.dart';
import 'package:core/di/locator.dart';
import 'package:domain/features/photos/repositories/photos_repository.dart';
import 'package:domain/features/photos/usecases/get_photos_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routing/app_router.dart';
import '../../../widgets/app_loader.dart';
import '../../../widgets/cubit_widget_error.dart';
import '../bloc/feed_view/feed_cubit.dart';
import '../widgets/photo_item.dart';

@RoutePage()
class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final _listController = ScrollController();
  final FeedCubit _cubit = FeedCubit(locator<GetPhotosUseCase>());

  Future<void> _scrollListener() async {
    if (_listController.position.pixels ==
        _listController.position.maxScrollExtent) {
      await _cubit.loadPhotos();
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
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(SearchRoute());
              },
              icon: const Icon(Icons.search),
            ),
          ],
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
              return CubitErrorWidget(
                error: state.error,
                tryAgainFunc: _cubit.tryAgainFunc,
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
