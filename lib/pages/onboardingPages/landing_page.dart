import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/pages/bottomNavPages/bottom_nav_pages.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/pages/onboardingPages/signup.dart';
import 'package:realtz_mobile/providers/auth_provider.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var currentStep = 1;

  @override
  void initState() {
    super.initState();
    // checkAuth();
  }

  void checkAuth() async {
    final authData = await getAuthData();
    final bool isLoggedIn = authData['isLoggedIn'] ?? false;
    if (isLoggedIn) {
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const BottomNavPages();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RedirectToHpme(
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Logo',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const Login();
                        }),
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(6, 46, 124, 1),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Skip to login',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  text: 'Find the best place \nto live ',
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'comfortably',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectur\nadipiscing elit, sed.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          currentStep == 1
                              ? 'assets/images/landing-page-bg-1.png'
                              : currentStep == 2
                                  ? 'assets/images/landing-page-bg-2.png'
                                  : 'assets/images/landing-page-bg-3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          currentStep == 1
                              ? ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      currentStep = 2;
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                      shape: const MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                      elevation:
                                          const MaterialStatePropertyAll(20)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 45,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : currentStep == 2
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          currentStep = 3;
                                        });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                          shape: const MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                          elevation:
                                              const MaterialStatePropertyAll(
                                                  20)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45,
                                          vertical: 12,
                                        ),
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                            return const Signup();
                                          }),
                                        );
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                          shape: const MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                          elevation:
                                              const MaterialStatePropertyAll(
                                                  20)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45,
                                          vertical: 12,
                                        ),
                                        child: Text(
                                          'Get Started',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
