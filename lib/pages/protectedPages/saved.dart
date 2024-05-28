import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/unprotectedPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
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
            SingleChildScrollView(
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
                                      Icons.favorite_border_rounded,
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
            if (loading)
              const Opacity(
                opacity: 0.4,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black,
                ),
              ),
            if (loading)
              const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
