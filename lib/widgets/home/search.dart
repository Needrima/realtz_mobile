import 'dart:io';

import 'package:flutter/material.dart';
import 'package:realtz_mobile/widgets/galleryRow/gallery_row.dart';
import 'dart:async';

import 'package:realtz_mobile/widgets/loader/loader.dart';

class HomeSearch extends SearchDelegate {
  List<Widget> results = [
    // GalleryRow(),
  ];

  // Delay duration in milliseconds
  static const int delayDuration = 3000;

  // Timer variable
  Timer? _debounceTimer;

  // Simulated API call function
  fetchSearchResults(String query) {
    if (query.isEmpty) return;
    // Replace with actual API call code
    print('Fetching results for: $query');
    results = [
      const GalleryRow(),
      const GalleryRow(),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(
          // Customize your search text style here
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search logic and return the results
    return results.isEmpty
        ? const Center(
            child: Loader(
              backgroundColor: Colors.black,
            ),
          )
        : Column(children: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Debounce function to delay API call
    void debounce(String queryString) {
      if (_debounceTimer != null) {
        _debounceTimer!.cancel();
      }
      _debounceTimer = Timer(const Duration(milliseconds: delayDuration), () {
        // Perform your API call here
        fetchSearchResults(queryString);
      });
    }

    debounce(query);

    if (query.isEmpty) {
      return const SingleChildScrollView(
        child: Column(children: [
          GalleryRow(),
          GalleryRow(),
          GalleryRow(),
          GalleryRow(),
          GalleryRow(),
          GalleryRow(),
        ]),
      );
    }

    return results.isEmpty
        ? const Center(
            child: Loader(
              backgroundColor: Colors.black,
            ),
          )
        : Column(children: results);
  }
}
