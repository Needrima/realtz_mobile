import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/signup.dart';

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
  String? firstname,
      lastname,
      username,
      email,
      phoneNumber,
      password,
      confirmPassword;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Theme.of(context).colorScheme.inversePrimary),
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
                        child: const Text('Forgot password ?'),
                        onTap: () {
                          print('forgot password clicked');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  TextButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      // TODO: make api call to signup user
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.inversePrimary),
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
                          ? const CircularProgressIndicator.adaptive(
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
                            color: Theme.of(context).colorScheme.inversePrimary,
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
    );
  }
}
