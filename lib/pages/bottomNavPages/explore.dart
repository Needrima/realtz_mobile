import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/galleryRow/gallery_row.dart';
import 'package:realtz_mobile/widgets/explore/explore_search_delegate.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _searchInputController = TextEditingController();
  final bool loading = false;

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    final authData = await getAuthData();
    final bool isLoggedIn = authData['isLoggedIn'] ?? false;
    if (!isLoggedIn) {
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Login();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ExploreSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const SingleChildScrollView(
              child: Column(
                children: [
                  GalleryRow(),
                  GalleryRow(),
                  GalleryRow(),
                  GalleryRow(),
                  GalleryRow(),
                  GalleryRow(),
                ],
              ),
            ),
            if (loading)
              const Padding(
                padding: EdgeInsets.only(
                  top: 42,
                ),
                child: Opacity(
                  opacity: 0.4,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.black,
                  ),
                ),
              ),
            if (loading)
              const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              ),
            // Positioned(
            //   top: 0,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: MediaQuery.of(context).size.width * 0.8,
            //         height: 40,
            //         child: TextField(
            //           controller: _searchInputController,
            //           decoration: InputDecoration(
            //             hintText: 'search',
            //             hintStyle: Theme.of(context).textTheme.labelMedium,
            //             prefixIcon: const Icon(
            //               Icons.search,
            //             ),
            //             prefixIconColor:
            //                 Theme.of(context).colorScheme.inversePrimary,
            //             border: const OutlineInputBorder(
            //               borderSide: BorderSide(style: BorderStyle.none),
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(20),
            //               ),
            //             ),
            //             enabledBorder: const OutlineInputBorder(
            //               borderSide: BorderSide(style: BorderStyle.none),
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(20),
            //               ),
            //             ),
            //             filled: true,
            //             fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         'search',
            //         style: TextStyle(
            //             color: Theme.of(context).colorScheme.inversePrimary,
            //             fontWeight: FontWeight.w700),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
