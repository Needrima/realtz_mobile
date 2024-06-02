import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/unprotectedPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/home/single_product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController homePageController = PageController();
  final PageController trendingPageController = PageController();
  String currentTab = 'home';
  bool loading = false;

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

  List<Widget> homeProducts = const [
    SingleProduct(productId: 1),
    SingleProduct(productId: 2),
    SingleProduct(productId: 3),
    SingleProduct(productId: 4),
  ];

  List<Widget> trendingProducts = const [
    SingleProduct(productId: 1),
    SingleProduct(productId: 2),
    SingleProduct(productId: 3),
    SingleProduct(productId: 4),
  ];

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<AuthProvider>(context).token);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            currentTab == 'home'
                ? homeProducts.isNotEmpty
                    ? PageView.builder(
                        controller: homePageController,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (int index) {
                          final int currentPage = index + 1;
                          if (homeProducts.length - currentPage < 1) {
                            setState(() {
                              loading = true;
                            });
                          }
                        },
                        itemCount: homeProducts.length,
                        itemBuilder: (context, index) {
                          return homeProducts[index];
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                      )
                : trendingProducts.isNotEmpty
                    ? PageView.builder(
                        controller: trendingPageController,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (int index) {
                          final int currentPage = index + 1;
                          if (homeProducts.length - currentPage < 2) {
                            setState(() {
                              loading = true;
                            });
                            print('fetching more trending products...');
                          }
                        },
                        itemCount: trendingProducts.length,
                        itemBuilder: (context, index) {
                          return trendingProducts[index];
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                      ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 'home';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab == 'home'
                                ? Colors.white
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = 'trending';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab == 'trending'
                                ? Colors.white
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (loading)
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
