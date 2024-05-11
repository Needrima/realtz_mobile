import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
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
                    text: 'johndoe@gmail.com',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            OtpTextField(
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
              onSubmit: (String verificationCode) {
                print(verificationCode);
              }, // end onSubmit
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              // trigger conditionally depending on Countdown state
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const Login();
                //     },
                //   ),
                // );
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
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
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
                    const Chip(
                      label: Text('00:19'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      backgroundColor: Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                    GestureDetector(
                      // trigger conditionally depending on Countdown state
                      onTap: () {
                        print('resending otp');
                      },
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
                      height: 70,
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
