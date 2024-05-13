import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:realtz_mobile/constants/constants.dart';
import 'package:realtz_mobile/misc/time_formatter.dart';
import 'package:realtz_mobile/pages/signup.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  var isPasswordShown = false;
  var isConfirmPasswordShown = false;
  final TextEditingController passwordController = TextEditingController();
  late Timer timer;
  int secondsRemaining = 180;

  String? password, confirmPassword, email;
  bool loading = false;
  int currentStep = 3;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (!context.mounted) return;
      setState(() {
        if (secondsRemaining == 0) {
          timer.cancel();
          // Timer completed, handle here
        } else {
          secondsRemaining--;
        }
      });
    });
  }

  Future<void> resendOTP(Map<String, dynamic> resendOTPData) async {
    setState(() {
      loading = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/send-otp');
      var response =
          await http.post(url, body: jsonEncode(resendOTPData), headers: {
        'content-type': 'application/json',
      });

      final body = jsonDecode(response.body);

      setState(() {
        loading = false;
      });

      if (response.statusCode != 200) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${body['error']}',
              style: const TextStyle(color: Colors.white),
            ),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            duration: const Duration(seconds: 5),
          ),
        );
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${body['message']}',
              style: const TextStyle(color: Colors.white),
            ),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (error) {
      setState(() {
        loading = false;
      });

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          showCloseIcon: true,
          closeIconColor: Colors.white,
          duration: const Duration(seconds: 5),
        ),
      );
    }
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
                text: currentStep == 1
                    ? 'Reset your '
                    : currentStep == 2
                        ? 'Enter '
                        : 'Complete ',
                style: Theme.of(context).textTheme.titleLarge,
                children: <TextSpan>[
                  TextSpan(
                    text: currentStep == 1
                        ? 'password'
                        : currentStep == 2
                            ? 'code'
                            : 'password reset',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            currentStep == 1
                ? Text(
                    'Lorem ipsum dolor sit amet, consecturadipiscing',
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                : currentStep == 2
                    ? RichText(
                        text: TextSpan(
                          text: 'Enter the 6 diigits code sent to\n',
                          style: Theme.of(context).textTheme.displayMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'obc@xyz.com',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        'Complete your password reset',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
            const SizedBox(
              height: 25,
            ),
            currentStep == 1
                ? Form(
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
                          height: 40,
                        ),
                        TextButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            // TODO: make api call to login user
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
                                ? const CircularProgressIndicator.adaptive(
                                    backgroundColor: Colors.white,
                                  )
                                : const Text(
                                    'Send OTP',
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
                  )
                : currentStep == 2
                    ? OtpTextField(
                        keyboardType: TextInputType.number,
                        numberOfFields: 6,
                        borderColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        fieldHeight: 48,
                        fieldWidth: 48,
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                          // print(code);
                        },
                        //runs when every textfield is filled
                        onSubmit: (verificationCode) {}, // end onSubmit
                      )
                    : Form(
                        key: formKey2,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: passwordController,
                              obscureText: !isPasswordShown,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                prefixIconColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
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
                                suffixIconColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(34, 34, 34, 0.05),
                              ),
                              validator: (value) {
                                if (RegExp(r'[A-Z]+')
                                        .hasMatch(value.toString()) &&
                                    RegExp(r'[a-z]+')
                                        .hasMatch(value.toString()) &&
                                    RegExp(r'[0-9]')
                                        .hasMatch(value.toString()) &&
                                    RegExp(r'[!@#$%^&*(”’)+,-./:;<=>?_^`{|~]+')
                                        .hasMatch(value.toString()) &&
                                    (value.toString().length >= 8)) {
                                  return null;
                                } else {
                                  return 'Password must be atleast 8 characters containing \none uppercase, character one lowercase character, \none number and one of the special characters \n !@#\$%^&*(”’)+,-./:;<=>?_^`{|~';
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {
                                password = value;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              obscureText: !isConfirmPasswordShown,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                hintText: 'Confirm password',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                prefixIconColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isConfirmPasswordShown
                                        ? Icons.security
                                        : Icons.remove_red_eye,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isConfirmPasswordShown =
                                          !isConfirmPasswordShown;
                                    });
                                  },
                                ),
                                suffixIconColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(34, 34, 34, 0.05),
                              ),
                              validator: (value) {
                                if (value.toString() !=
                                    passwordController.text) {
                                  return 'Passwords mismatch';
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {
                                confirmPassword = value;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextButton(
                              onPressed: loading
                                  ? null
                                  : () {
                                      if (formKey2.currentState!.validate()) {
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'invalid information somewhere',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
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
                                  horizontal: 45,
                                  vertical: 10,
                                ),
                                child: loading
                                    ? const CircularProgressIndicator.adaptive(
                                        backgroundColor: Colors.white,
                                      )
                                    : const Text(
                                        'Reset Password',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    currentStep == 2
                        ? Chip(
                            avatar: const Icon(
                              Icons.alarm,
                              color: Color.fromRGBO(34, 34, 34, 0.6),
                            ),
                            label:
                                Text(formatTime(secondsRemaining).toString()),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(34, 34, 34, 0.05),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    currentStep == 2
                        ? GestureDetector(
                            // trigger conditionally depending on Countdown state
                            onTap: secondsRemaining == 0 && !loading
                                ? () {
                                    final Map<String, dynamic> resendOTPData = {
                                      'channel': 'email',
                                      'email': email,
                                    };
                                    resendOTP(resendOTPData);
                                    setState(() {
                                      secondsRemaining = 180;
                                    });
                                    startTimer();
                                  }
                                : null,
                            child: RichText(
                              text: TextSpan(
                                text: 'Didn\'t receieve OTP? ',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Resend OTP',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
