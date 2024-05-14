import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/protectedPages/protected_pages.dart';
import 'package:realtz_mobile/pages/unprotectedPages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realtz',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          titleMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Color.fromRGBO(34, 34, 34, 1),
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(34, 34, 34, 0.4),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(39, 113, 255, 1),
          inversePrimary: const Color.fromRGBO(39, 113, 255, 1),
        ),
        fontFamily: 'CustomOpenSans',
        useMaterial3: true,
      ),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
