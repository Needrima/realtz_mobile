import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String productTitle;
  const SingleProduct({super.key, required this.productTitle});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final PageController pageController = PageController();

  List<Widget> images = [
    Image.asset(
      'assets/images/product1-1.jpg',
      width: double.infinity,
    ),
    Image.asset(
      'assets/images/product1-2.jpg',
      width: double.infinity,
    ),
    Image.asset(
      'assets/images/product1-3.jpg',
      width: double.infinity,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              print(index);
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return images[index];
            },
          ),
          const Positioned(
            right: 15,
            bottom: 40,
            child: Column(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(
                  height: 16,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  // color: Theme.of(context).colorScheme.inversePrimary,
                  size: 32,
                ),
                SizedBox(
                  height: 16,
                ),
                Icon(
                  Icons.comment_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(
                  height: 16,
                ),
                Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(
                  height: 16,
                ),
                Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '.Nov 2nd',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 222,
                  child: Text(
                    '#realestate#parkinglot#swimmingpool#realestate#parkinglot#swimmingpool',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
