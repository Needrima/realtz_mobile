import 'package:flutter/material.dart';
import 'package:realtz_mobile/helpers/popup.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';
import 'package:realtz_mobile/widgets/settings/Account/account.dart';
import 'package:realtz_mobile/widgets/settings/settings_section.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<Map<String, dynamic>> accountSettingsOptions = [
    {
      'label': 'Account',
      'iconData': Icons.person,
      'type': 'route',
      'route': const Account(),
    },
    {
      'label': 'Privacy',
      'iconData': Icons.private_connectivity_rounded,
      'type': 'route',
      'route': const Account(),
    },
    {
      'label': 'Security',
      'iconData': Icons.security_rounded,
      'type': 'route',
      'route': const Account(),
    },
  ];

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
                  popUp(
                    context,
                    const Text('Logout ?'),
                    const Text('Are you sure you want to logout ?'),
                    [
                      GestureDetector(
                        onTap: () {
                          authLogout();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                              (Route<dynamic> route) =>
                                  false // This will remove all previous routes
                              );
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ],
                    true,
                  );
                },
                icon: const Icon(Icons.logout))
          ],
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(34, 34, 34, 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsSection(options: accountSettingsOptions),
            ],
          ),
        ),
      ),
    );
  }
}
