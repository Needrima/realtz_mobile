import 'package:flutter/material.dart';
import 'package:realtz_mobile/widgets/home/reply.dart';

class ProductComment extends StatefulWidget {
  const ProductComment({super.key});

  @override
  State<ProductComment> createState() => _ProductCommentState();
}

class _ProductCommentState extends State<ProductComment> {
  final TextEditingController _commentInputController = TextEditingController();

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
                    return const CommentReply();
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
                        'Reply',
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

  @override
  Widget build(BuildContext context) {
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
                  color: Theme.of(context).colorScheme.inversePrimary,
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
        color: Colors.black,
        elevation: 20,
        icon: const Icon(Icons.more_vert),
        onSelected: (result) {
          // Handle the menu selection
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 'edit',
            child: Text(
              'Edit',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
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
  }
}
