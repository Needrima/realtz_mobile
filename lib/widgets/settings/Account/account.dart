import 'package:flutter/material.dart';
import 'package:realtz_mobile/widgets/settings/Account/password.dart';
import 'package:realtz_mobile/widgets/settings/Account/user_information.dart';
import 'package:realtz_mobile/widgets/settings/settings_section.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<Map<String, dynamic>> accountOptions = [
    {
      'label': 'User information',
      'type': 'route',
      'route': const UserInformation(),
    },
    {
      'label': 'Password',
      'type': 'route',
      'route': const Password(),
    },
    {
      'label': 'Delete Account',
      'type': 'action',
      'action': () {
        print('deleting account');
      },
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
            SettingsSection(options: accountOptions),
          ],
        ),
      ),
    );
  }
}
