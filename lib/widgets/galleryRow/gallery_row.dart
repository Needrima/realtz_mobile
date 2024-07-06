import 'package:flutter/material.dart';

class GalleryRow extends StatefulWidget {
  const GalleryRow({
    super.key,
  });

  @override
  State<GalleryRow> createState() => _GalleryRowState();
}

class _GalleryRowState extends State<GalleryRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(2.5),
            height: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/product1-1.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '2k',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(2.5),
            height: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/product1-2.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '2k',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(2.5),
            height: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/product1-3.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '2k',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
