import 'package:flutter/material.dart';

class CommentReply extends StatefulWidget {
  const CommentReply({super.key});

  @override
  State<CommentReply> createState() => _CommentReplyState();
}

class _CommentReplyState extends State<CommentReply> {
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
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
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
