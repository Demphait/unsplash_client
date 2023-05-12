import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/di/locator.dart';
import 'package:domain/features/photos/usecases/search_photos_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/features/photos/bloc/search_view/search_cubit.dart';
import 'package:presentation/features/photos/widgets/photo_item.dart';
import 'package:presentation/features/photos/widgets/search_widget.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/widgets/app_loader.dart';
import 'package:presentation/widgets/cubit_widget_error.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static const routeName = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchCubit _cubit = SearchCubit(locator<SearchPhotosUseCase>());
  String query = '';
  Timer? debouncer;

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void _onSearchTextChanged(String input) {
    debouncer?.cancel();

    debouncer = Timer(const Duration(milliseconds: 1000), () {
      _cubit.searchPhotos(input);
      query = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: SearchWidget(
            hintText: 'Name of photo',
            onChanged: _onSearchTextChanged,
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.map(
              empty: (state) => Center(
                child: Text('The input field is empty or no result was found'),
              ),
              loading: (state) => AppLoader(),
              error: (state) => CubitErrorWidget(
                  error: state.error,
                  tryAgainFunc: () => _cubit.searchPhotos(query)),
              data: (state) => ListView.builder(
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return PhotoItem(
                      photo: photo,
                      onTap: () => context.router.push(DetailedRoute(
                          photo: state.photos[index]))); //TODO LATER
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
