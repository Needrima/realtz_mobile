import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:realtz_mobile/constants/constants.dart';
import 'package:realtz_mobile/helpers/snackbar.dart';
import 'package:realtz_mobile/pages/onboardingPages/forgot_password.dart';
import 'package:realtz_mobile/pages/bottomNavPages/bottom_nav_pages.dart';
import 'package:realtz_mobile/pages/onboardingPages/signup.dart';
import 'package:http/http.dart' as http;
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';
import 'package:realtz_mobile/widgets/loader/loader.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isPasswordShown = false;
  var isConfirmPasswordShown = false;
  var loading = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  String? email, password;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> login(Map<String, dynamic> loginData) async {
    setState(() {
      loading = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/login');
      var response =
          await http.post(url, body: jsonEncode(loginData), headers: {
        'content-type': 'application/json',
      });

      final body = jsonDecode(response.body);

      setState(() {
        loading = false;
      });

      if (response.statusCode != 200) {
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['error']}');
      } else {
        await authLogin({
          'user': body['user'],
          'token': body['token'],
          'isLoggedIn': true,
        });
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const BottomNavPages();
            },
          ),
        );
      }
    } catch (error) {
      setState(() {
        loading = false;
      });

      if (!context.mounted) return;
      showSnackBar(context: context, message: error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RedirectToHome(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: const Color.fromRGBO(34, 34, 34, 0.05),
          flexibleSpace: Image.asset(
            'assets/images/verify-email-appbar-img.png', // Path to your image
            fit: BoxFit.cover,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: 'Let\'s ',
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'sign you in',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consecturadipiscing',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email address',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordShown,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordShown
                                ? Icons.security
                                : Icons.remove_red_eye,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordShown = !isPasswordShown;
                            });
                          },
                        ),
                        suffixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            'Forgot password ?',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ForgotPassword();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        formKey.currentState!.save();
                        final Map<String, dynamic> loginData = {
                          "email": email,
                          "password": password,
                        };
                        login(loginData);
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 10,
                        ),
                        child: loading
                            ? const Loader(
                                backgroundColor: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const Signup();
                        }),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.displayMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
