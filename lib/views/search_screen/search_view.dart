import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_client/views/feed/widgets/photo_item.dart';
import 'package:unsplash_client/views/search_screen/cubit/search_cubit.dart';
import 'package:unsplash_client/views/search_screen/widgets/search_widget.dart';
import 'package:unsplash_client/widgets/app_loader.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static const routeName = '/search';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchCubit _cubit = SearchCubit();
  String query = '';
  Timer? debouncer;

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void _onSearchTextChanged(String query) {
    debouncer?.cancel();

    debouncer = Timer(const Duration(milliseconds: 1000), () {
      _cubit.searchPhotos(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: SearchWidget(
            text: query,
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  ElevatedButton(
                    onPressed: () {
                      _cubit.searchPhotos(query);
                    },
                    child: const Text('Try again'),
                  ),
                ],
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
