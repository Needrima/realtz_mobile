import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/pages/protectedPages/protected_pages.dart';
import 'package:realtz_mobile/providers/auth_provider.dart';
import 'package:realtz_mobile/widgets/signup/signup_form.dart';
import 'package:realtz_mobile/widgets/signup/verify_email.dart';
// import 'package:http/http.dart' as http;
// import 'package:realtz_mobile/constants/constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var currentStep = 1;
  var email = '';
  var otpVerificationKey = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<AuthProvider>(context).isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const ProtectedPages();
          },
        ),
      );
    }
  }

  void onChangeStep(int step) {
    setState(() {
      currentStep = step;
    });
  }

  void setEmailAndOTPVerificationKey(
      String userEmail, String userOtpVerificationKey) {
    setState(() {
      email = userEmail;
      otpVerificationKey = userOtpVerificationKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentStep == 1
          ? SignupForm(
              onChangeStep: onChangeStep,
              setEmailAndOTPVerificationKey: setEmailAndOTPVerificationKey,
            )
          : VerifyEmail(
              email: email,
              otpVerificationKey: otpVerificationKey,
              setEmailAndOTPVerificationKey: setEmailAndOTPVerificationKey,
            ),
    );
  }
}
