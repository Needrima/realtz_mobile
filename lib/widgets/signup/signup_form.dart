import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:realtz_mobile/constants/constants.dart';
import 'package:realtz_mobile/helpers/snackbar.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:http/http.dart' as http;
import 'package:realtz_mobile/widgets/loader/loader.dart';

class SignupForm extends StatefulWidget {
  final void Function(int) onChangeStep;
  final void Function(String, String) setEmailAndOTPVerificationKey;
  const SignupForm(
      {super.key,
      required this.onChangeStep,
      required this.setEmailAndOTPVerificationKey});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
  bool agreement = false;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signup(Map<String, dynamic> userSignupData) async {
    setState(() {
      loading = true;
    });

    try {
      var url = Uri.parse('$userServiceBaseURI/signup');
      var response =
          await http.post(url, body: jsonEncode(userSignupData), headers: {
        'content-type': 'application/json',
      });

      final body = jsonDecode(response.body);

      setState(() {
        loading = false;
      });

      if (response.statusCode != 201 && response.statusCode != 200) {
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['error']}');
      } else {
        widget.setEmailAndOTPVerificationKey(
          email!,
          body['otp_verification_key'],
        );
        widget.onChangeStep(2);
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Create your ',
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'account',
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
                'Lorem ipsum dolor sit amet, consecturadipiscing',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Firstname',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.person,
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
                      validator: (value) {
                        if (!RegExp(r'^[a-zA-Z-]{3,}$')
                            .hasMatch(value.toString())) {
                          return 'Firstname must be atleast 3 alphabets with "-" as the \nonly special character allowed';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        firstname = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Lastname',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.person,
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
                      validator: (value) {
                        if (!RegExp(r'^[a-zA-Z-]{3,}$')
                            .hasMatch(value.toString())) {
                          return 'Lastname must be atleast 3 alphabets with "-" as the \nonly special character allowed';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        lastname = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.person,
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
                      validator: (value) {
                        if (!RegExp(r'^[a-zA-Z-]{3,}$')
                            .hasMatch(value.toString())) {
                          return 'Username must be atleast 3 alphabets with "-" as the \nonly special character allowed';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        username = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
                      validator: (value) {
                        if (!RegExp(
                                r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
                            .hasMatch(value.toString())) {
                          return 'Enter a valid email address e.g abc@xyz.com';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.phone_rounded,
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
                      validator: (value) {
                        if (!RegExp(r'^0\d{10}$').hasMatch(value.toString())) {
                          return 'Enter a valid nigerian phone number e,g 08023456789';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        phoneNumber = value;
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
                      validator: (value) {
                        if (RegExp(r'[A-Z]+').hasMatch(value.toString()) &&
                            RegExp(r'[a-z]+').hasMatch(value.toString()) &&
                            RegExp(r'[0-9]').hasMatch(value.toString()) &&
                            RegExp(r'[!@#$%^&*(”’)+,-./:;<=>?_^`{|~]+')
                                .hasMatch(value.toString()) &&
                            (value.toString().length >= 8)) {
                          return null;
                        } else {
                          return 'Password must be atleast 8 characters containing \none uppercase, character one lowercase character, \none number and one of the special characters \n !@#\$%^&*(”’)+,-./:;<=>?_^`{|~';
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordShown
                                ? Icons.security
                                : Icons.remove_red_eye,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordShown = !isConfirmPasswordShown;
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
                      validator: (value) {
                        if (value.toString() != passwordController.text) {
                          return 'Passwords mismatch';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        confirmPassword = value;
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return TermsAndConditions();
                        //     },
                        //   ),
                        // );
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: agreement,
                            onChanged: (value) {
                              setState(() {
                                agreement = value!;
                              });
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'By checking the box, you agree to our ',
                              style: Theme.of(context).textTheme.displayMedium,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'terms ',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'and\n',
                                ),
                                TextSpan(
                                  text: 'conditions',
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: loading
                          ? null
                          : () {
                              if (!formKey.currentState!.validate()) {
                                showSnackBar(
                                    context: context,
                                    message: 'invalid information somewhere');
                                return;
                              }

                              if (!agreement) {
                                showSnackBar(
                                  context: context,
                                  message:
                                      'you have not agreed to out terms and conditions',
                                );
                              } else {
                                formKey.currentState!.save();
                                // TODO: make api call to signup user
                                final Map<String, dynamic> userSignupData = {
                                  'user_type': 'user',
                                  'firstname': firstname,
                                  'lastname': lastname,
                                  'username': username,
                                  'email': email,
                                  'phone_number': phoneNumber,
                                  'password': password,
                                  'confirm_password': confirmPassword,
                                  'agreement': agreement,
                                };
                                signup(userSignupData);
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
                          horizontal: 45,
                          vertical: 10,
                        ),
                        child: loading
                            ? const Loader(
                                backgroundColor: Colors.white,
                              )
                            : const Text(
                                'Create Account',
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
              const SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return const Login();
                      }),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.displayMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
