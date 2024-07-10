import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/nonBottomNavPages/agent_profile.dart';
import 'package:realtz_mobile/widgets/home/comment.dart';
import 'package:share_plus/share_plus.dart';

class SingleProduct extends StatefulWidget {
  final int productId;
  const SingleProduct({super.key, required this.productId});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final PageController pageController = PageController();
  final TextEditingController _commentInputController = TextEditingController();
  bool liked = false;

  void showComments() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProductComment();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        maxLines: null,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        controller: _commentInputController,
                        decoration: const InputDecoration(
                            hintText: 'Leave a comment',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.inversePrimary,
                        ),
                        shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Comment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      // set eleavtion to zero to make sure backgroundColor property works as expected
      elevation: 0,
      backgroundColor: Colors.black,
      barrierColor: Colors.transparent,
      showDragHandle: true,
    );
  }

  void _shareContent(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;

    Share.share(
      'Check out this awesome apartment',
      subject: 'Realtz awesome 4 bedroom apartment',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

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
    List<Widget> images = [
      Image.asset(
        'assets/images/product${widget.productId}-1.jpg',
        width: double.infinity,
      ),
      Image.asset(
        'assets/images/product${widget.productId}-2.jpg',
        width: double.infinity,
      ),
      Image.asset(
        'assets/images/product${widget.productId}-3.jpg',
        width: double.infinity,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {},
            itemCount: images.length,
            itemBuilder: (context, index) {
              return images[index];
            },
          ),
          Positioned(
            right: 15,
            bottom: 40,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AgentProfile()));
                  },
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: liked
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Colors.white,
                    // color: Theme.of(context).colorScheme.inversePrimary,
                    size: 32,
                  ),
                ),
                const Text(
                  '1.2k',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: showComments,
                  child: const Icon(
                    Icons.comment_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const Text(
                  '600',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    _shareContent(context);
                  },
                  child: const Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Icon(
                  Icons.save_outlined,
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
                  height: 5,
                ),
                const SizedBox(
                  width: 220,
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
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'more',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
