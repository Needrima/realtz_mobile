import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:realtz_mobile/constants/constants.dart';
import 'package:realtz_mobile/helpers/snackbar.dart';
import 'package:realtz_mobile/misc/time_formatter.dart';
import 'package:realtz_mobile/pages/bottomNavPages/bottom_nav_pages.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/pages/onboardingPages/signup.dart';
import 'package:http/http.dart' as http;
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';
import 'package:realtz_mobile/widgets/loader/loader.dart';

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
  String? password, confirmPassword, email, otp, otpVerificationKey;
  bool loading = false;
  bool verifyingEmail = false;
  bool resendingOTP = false;
  bool restingPassword = false;
  int currentStep = 1;

  @override
  void initState() {
    super.initState();
    // checkAuth();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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

  Future<void> startPasswordRecovery(
      Map<String, dynamic> startPasswordRecoveryData) async {
    setState(() {
      verifyingEmail = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/start-password-recovery');
      var response = await http
          .post(url, body: jsonEncode(startPasswordRecoveryData), headers: {
        'content-type': 'application/json',
      });

      final body = jsonDecode(response.body);

      setState(() {
        verifyingEmail = false;
      });

      if (response.statusCode != 200) {
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['error']}');
      } else {
        otpVerificationKey = body['otp_verification_key'];
        setState(() {
          currentStep = 2;
        });
      }
    } catch (error) {
      setState(() {
        verifyingEmail = false;
      });

      if (!context.mounted) return;
      showSnackBar(context: context, message: error.toString());
    }
  }

  Future<void> resendOTP(Map<String, dynamic> resendOTPData) async {
    setState(() {
      resendingOTP = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/send-otp');
      var response =
          await http.post(url, body: jsonEncode(resendOTPData), headers: {
        'content-type': 'application/json',
      });

      final body = jsonDecode(response.body);

      setState(() {
        resendingOTP = false;
      });

      if (response.statusCode != 200) {
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['error']}');
      } else {
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['message']}');
      }
    } catch (error) {
      setState(() {
        resendingOTP = false;
      });

      if (!context.mounted) return;
      showSnackBar(context: context, message: error.toString());
    }
  }

  Future<void> resetPassword(Map<String, dynamic> resetPasswordData) async {
    setState(() {
      restingPassword = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/complete-password-recovery');
      var response =
          await http.post(url, body: jsonEncode(resetPasswordData), headers: {
        'content-type': 'application/json',
      });

      final body = jsonDecode(response.body);

      setState(() {
        restingPassword = false;
      });

      if (response.statusCode != 200) {
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['error']}');
      } else {
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('Password reset'),
              content: Text('${body["message"]}'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Login();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Proceed to login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      setState(() {
        resendingOTP = false;
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
                            text: 'Enter the 6 digits code sent to\n',
                            style: Theme.of(context).textTheme.displayMedium,
                            children: <TextSpan>[
                              TextSpan(
                                text: email,
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
                              hintStyle:
                                  Theme.of(context).textTheme.labelMedium,
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
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                final Map<String, dynamic>
                                    startPasswordRecoveryData = {
                                  'email': email,
                                };
                                startPasswordRecovery(
                                    startPasswordRecoveryData);
                              } else {
                                showSnackBar(
                                  context: context,
                                  message: 'Please enter a valid email address',
                                );
                              }
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
                              child: verifyingEmail
                                  ? const Loader(
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
                          },
                          //runs when every textfield is filled
                          onSubmit: (verificationCode) {
                            setState(() {
                              otp = verificationCode;
                              currentStep = 3;
                            });
                          }, // end onSubmit
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
                                onPressed: restingPassword
                                    ? null
                                    : () {
                                        if (formKey2.currentState!.validate()) {
                                          formKey2.currentState!.save();
                                          final Map<String, dynamic>
                                              resetPasswordData = {
                                            'email': email,
                                            'otp': otp,
                                            'otp_verification_key':
                                                otpVerificationKey,
                                            'new_password': password,
                                            'confirm_password': confirmPassword,
                                          };
                                          resetPassword(resetPasswordData);
                                        } else {
                                          showSnackBar(
                                            context: context,
                                            message:
                                                'Please enter a valid password',
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
                                  child: restingPassword
                                      ? const Loader(
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
                              onTap: email != '' &&
                                      secondsRemaining == 0 &&
                                      !resendingOTP
                                  ? () {
                                      final Map<String, dynamic> resendOTPData =
                                          {
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
      ),
    );
  }
}
