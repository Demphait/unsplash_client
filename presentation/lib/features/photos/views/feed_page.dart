import 'package:auto_route/auto_route.dart';
import 'package:core/di/locator.dart';
import 'package:domain/features/photos/usecases/get_photos_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/features/photos/bloc/feed_view/feed_cubit.dart';
import 'package:presentation/features/photos/widgets/photo_item.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/widgets/app_loader.dart';
import 'package:presentation/widgets/cubit_widget_error.dart';



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
            return state.map(
              empty: (state) => Center(
                child: Text('Empty'),
              ),
              loading: (state) => AppLoader(),
              error: (state) => CubitErrorWidget(
                error: state.error,
                tryAgainFunc: _cubit.tryAgain,
              ),
              data: (state) => RefreshIndicator(
                onRefresh: _cubit.loadPhotos,
                child: ListView.builder(
                  controller: _listController,
                  itemCount: state.photos.length,
                  itemBuilder: (context, index) {
                    return PhotoItem(
                      photo: state.photos[index],
                      onTap: () => context.router
                          .push(DetailedRoute(photo: state.photos[index])), //TODO LATER
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
