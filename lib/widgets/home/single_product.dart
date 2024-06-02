import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final int productId;
  const SingleProduct({super.key, required this.productId});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final PageController pageController = PageController();
  final TextEditingController _commentInputController = TextEditingController();

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
                  itemBuilder: (context, index) {
                    return ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis, nostrum eius maiores labore vitae quibusdam recusandae molestias cupiditate in consequatur? A repellat iste sequi, odit neque asperiores quam, impedit debitis obcaecati totam tenetur laudantium? Dolores corporis cumque minima vero fugit.',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                '02-01-2024 6:30pm',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Column(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Text(
                                    '200',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: showReplies,
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.reply_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (result) {
                          // Handle the menu selection
                          print('Selected: $result');
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // tileColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 5,
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
                      onPressed: () {
                        print('commenting');
                      },
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

  void showReplies() {
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
                  itemBuilder: (context, index) {
                    return ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis, nostrum eius maiores labore vitae quibusdam recusandae molestias cupiditate in consequatur? A repellat iste sequi, odit neque asperiores quam, impedit debitis obcaecati totam tenetur laudantium? Dolores corporis cumque minima vero fugit.',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                '02-01-2024 6:30pm',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Column(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Text(
                                    '200',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (result) {
                          // Handle the menu selection
                          print('Selected: $result');
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // tileColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 5,
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
                            hintText: 'Leave a reply',
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
                      onPressed: () {
                        print('replying');
                      },
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
                        'Reply',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
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
            onPageChanged: (index) {
              print(index);
            },
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
                const Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    print('liking');
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
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
                const Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                  size: 32,
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
                  onTap: () {
                    print('view more');
                  },
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
