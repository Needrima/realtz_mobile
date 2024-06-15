import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _searchInputController = TextEditingController();
  final bool loading = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 42,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
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
                    ),
                    Row(
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
                                    'assets/images/product2-1.jpg',
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
                                    'assets/images/product2-2.jpg',
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
                                    'assets/images/product2-3.jpg',
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
                    ),
                    Row(
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
                                    'assets/images/product3-1.jpg',
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
                                    'assets/images/product3-2.jpg',
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
                                    'assets/images/product3-3.jpg',
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
                    ),
                    Row(
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
                                    'assets/images/product4-1.jpg',
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
                                    'assets/images/product4-2.jpg',
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
                                    'assets/images/product4-3.jpg',
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
                    ),
                    Row(
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
                    ),
                    Row(
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
                                    'assets/images/product2-1.jpg',
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
                                    'assets/images/product2-2.jpg',
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
                                    'assets/images/product2-3.jpg',
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
                    ),
                    Row(
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
                                    'assets/images/product3-1.jpg',
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
                                    'assets/images/product3-2.jpg',
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
                                    'assets/images/product3-3.jpg',
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
                    ),
                    Row(
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
                                    'assets/images/product4-1.jpg',
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
                                    'assets/images/product4-2.jpg',
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
                                    'assets/images/product4-3.jpg',
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
                    ),
                  ],
                ),
              ),
            ),
            if (loading)
              const Padding(
                padding: EdgeInsets.only(
                  top: 42,
                ),
                child: Opacity(
                  opacity: 0.4,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.black,
                  ),
                ),
              ),
            if (loading)
              const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              ),
            Positioned(
              top: 0,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40,
                    child: TextField(
                      controller: _searchInputController,
                      decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'search',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w700),
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
