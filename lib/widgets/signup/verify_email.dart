import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:realtz_mobile/constants/constants.dart';
import 'package:realtz_mobile/pages/login.dart';
import 'package:http/http.dart' as http;

class VerifyEmail extends StatefulWidget {
  final String email;
  final String otpVerificationKey;
  const VerifyEmail(
      {super.key, required this.email, required this.otpVerificationKey});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late Timer timer;
  int secondsRemaining = 180;
  bool loading = false;

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

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minuteString = minutes < 10 ? '0$minutes' : '$minutes';
    String secondString =
        remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minuteString:$secondString';
  }

  Future<void> verifyEmail(Map<String, dynamic> verifyEmailData) async {
    setState(() {
      loading = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/verify-email');
      var response =
          await http.post(url, body: jsonEncode(verifyEmailData), headers: {
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
            content: Text('${body['error']}'),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            duration: const Duration(seconds: 5),
          ),
        );
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${body['message']}'),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            duration: const Duration(seconds: 5),
          ),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const Login();
            },
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
          content: Text(error.toString()),
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
                text: 'Enter ',
                style: Theme.of(context).textTheme.titleLarge,
                children: <TextSpan>[
                  TextSpan(
                    text: 'code',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: 'Enter the 6 diigits code sent to\n',
                style: Theme.of(context).textTheme.displayMedium,
                children: <TextSpan>[
                  TextSpan(
                    text: widget.email,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            OtpTextField(
              enabled: !loading,
              keyboardType: TextInputType.number,
              numberOfFields: 6,
              borderColor: Theme.of(context).colorScheme.inversePrimary,
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
              onSubmit: (verificationCode) {
                final Map<String, dynamic> verifyEmailData = {
                  'otp': verificationCode,
                  'otp_verification_key': widget.otpVerificationKey,
                  'email': widget.email,
                };
                verifyEmail(verifyEmailData);
              }, // end onSubmit
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              // trigger conditionally depending on Countdown state
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Login();
                    },
                  ),
                );
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Proceed to ',
                    style: Theme.of(context).textTheme.displayMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'login',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Chip(
                      avatar: const Icon(
                        Icons.alarm,
                        color: Color.fromRGBO(34, 34, 34, 0.6),
                      ),
                      label: Text(formatTime(secondsRemaining).toString()),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      backgroundColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                    GestureDetector(
                      // trigger conditionally depending on Countdown state
                      onTap: secondsRemaining == 0 && !loading
                          ? () {
                              //TODO: trigger resend OTP endpoint
                              setState(() {
                                secondsRemaining = 180;
                              });
                              startTimer();
                            }
                          : null,
                      child: RichText(
                        text: TextSpan(
                          text: 'Didn\'t receieve OTP? ',
                          style: Theme.of(context).textTheme.displayMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Resend OTP',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
