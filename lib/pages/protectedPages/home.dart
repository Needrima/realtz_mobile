import 'package:flutter/material.dart';
import 'package:realtz_mobile/widgets/home/single_product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController();

  List<Widget> pages = const [
    SingleProduct(productTitle: 'Product 1'),
    SingleProduct(productTitle: 'Product 2'),
    SingleProduct(productTitle: 'Product 3'),
    SingleProduct(productTitle: 'Product 4'),
    SingleProduct(productTitle: 'Product 5'),
  ];

  @override
  Widget build(BuildContext context) {
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
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Center(
                  child: pages[index],
                );
              },
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('switching to home products');
                    },
                    child: const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('switching to trending products');
                    },
                    child: const Text(
                      'Trending',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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
