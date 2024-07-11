import 'package:flutter/material.dart';
import 'package:realtz_mobile/widgets/settings/Security/password.dart';
import 'package:realtz_mobile/widgets/settings/settings_section.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  List<Map<String, dynamic>> securityOptions = [
    {
      'label': 'Change Password',
      'type': 'route',
      'route': const Password(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
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
            SettingsSection(options: securityOptions),
          ],
        ),
      ),
    );
  }
}
