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
  final PageController pageController = PageController();
  String currentTab = 'home';

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    final authData = await getAuthData();
    if (!authData['isLoggedIn']) {
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
    SingleProduct(productTitle: 'Home Product 1'),
    SingleProduct(productTitle: 'Home Product 2'),
    SingleProduct(productTitle: 'Home Product 3'),
    SingleProduct(productTitle: 'Home Product 4'),
    SingleProduct(productTitle: 'Home Product 5'),
  ];

  List<Widget> trendingProducts = const [
    SingleProduct(productTitle: 'Trending Product 1'),
    SingleProduct(productTitle: 'Trending Product 2'),
    SingleProduct(productTitle: 'Trending Product 3'),
    SingleProduct(productTitle: 'Trending Product 4'),
  ];

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<AuthProvider>(context).token);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                print(index);
              },
              itemCount: currentTab == 'home'
                  ? homeProducts.length
                  : trendingProducts.length,
              itemBuilder: (context, index) {
                return currentTab == 'home'
                    ? homeProducts[index]
                    : trendingProducts[index];
              },
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
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
