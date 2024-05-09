import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                text: 'Create your ',
                style: Theme.of(context).textTheme.titleLarge,
                children: <TextSpan>[
                  TextSpan(
                      text: 'account',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),
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
              child: Column(
                children: [
                  TextField(
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
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
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
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
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
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
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
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
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
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      prefixIconColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      prefixIconColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Text('Forgot password?'),
                        onTap: () {
                          print('forgot password clicked');
                        },
                      ),
                      GestureDetector(
                        child: const Text('Show password'),
                        onTap: () {
                          print('show password clicked');
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
