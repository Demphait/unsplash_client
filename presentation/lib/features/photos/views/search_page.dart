import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/di/locator.dart';
import 'package:domain/features/photos/usecases/search_photos_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_loader.dart';
import '../../../widgets/cubit_widget_error.dart';
import '../bloc/search_view/search_cubit.dart';
import '../widgets/photo_item.dart';
import '../widgets/search_widget.dart';

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
            if (state is LoadingSearchState) {
              return AppLoader();
            } else if (state is DataSearchState) {
              return ListView.builder(
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return PhotoItem(photo: photo);
                },
              );
            } else if (state is ErrorSearchState) {
              return CubitErrorWidget(
                error: state.error,
                tryAgainFunc: () => _cubit.searchPhotos(query),
              );
            } else if (state is EmptySearchState) {
              return const Center(
                child: Text('The input field is empty or no result was found'),
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
