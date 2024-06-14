import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/nonBottomNavPages/settings.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Placeholder for alignment, no content on the left
                    // width is 48 to match default width of right icon
                    const SizedBox(width: 48.0),

                    // Centered Profile text
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Settings icon on the right
                    IconButton(
                      padding: const EdgeInsets.all(3),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(244, 244, 244, 1),
                        ),
                      ),
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Settings()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage(
                            'assets/images/default-avatar.jpg'), // Update with your image path
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              print('editing image');
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Jane Doe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'janedoe@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(34, 34, 34, 0.6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        width: double.infinity,
                        height: 88,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Liked listings',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        width: double.infinity,
                        height: 88,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '30',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Saved listings',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Text(
                      'Recently liked listings',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color.fromRGBO(34, 34, 34, 1),
                      ),
                    ),
                  ],
                ),
                Stack(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
