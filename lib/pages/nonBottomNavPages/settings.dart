import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return RedirectToLogin(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  authLogout();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout))
          ],
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: const Padding(padding: EdgeInsets.all(6), child: Column()),
      ),
    );
  }
}
