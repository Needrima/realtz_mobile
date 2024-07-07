import 'dart:io';

import 'package:flutter/material.dart';
import 'package:realtz_mobile/widgets/galleryRow/gallery_row.dart';

class ExploreSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).colorScheme.inversePrimary,
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
    return Center(
      child: Text('You searched for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Widget> results = [
      // GalleryRow(),
      // GalleryRow(),
    ];

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
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.black,
            ),
          )
        : Column(children: results);
  }
}
