import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';
import 'package:realtz_mobile/widgets/home/single_product.dart';
import 'package:realtz_mobile/widgets/home/search.dart';
import 'package:realtz_mobile/widgets/loader/loader.dart';

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
    return RedirectToLogin(
      child: Scaffold(
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
                          child: Loader(
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
                            }
                          },
                          itemCount: trendingProducts.length,
                          itemBuilder: (context, index) {
                            return trendingProducts[index];
                          },
                        )
                      : const Center(
                          child: Loader(
                            backgroundColor: Colors.white,
                          ),
                        ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: false,
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainSemantics: true,
                      maintainInteractivity: true,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Row(
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
                    IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: HomeSearch(),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
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
                      Loader(
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
