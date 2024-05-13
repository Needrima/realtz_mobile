import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/protectedPages/explore.dart';
import 'package:realtz_mobile/pages/protectedPages/home.dart';
import 'package:realtz_mobile/pages/protectedPages/inbox.dart';
import 'package:realtz_mobile/pages/protectedPages/profile.dart';
import 'package:realtz_mobile/pages/protectedPages/saved.dart';

class ProtectedPages extends StatefulWidget {
  const ProtectedPages({super.key});

  @override
  State<ProtectedPages> createState() => _ProtectedPagesState();
}

class _ProtectedPagesState extends State<ProtectedPages> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    Home(),
    Saved(),
    Explore(),
    Inbox(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Saved',
            tooltip: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
            tooltip: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_rounded),
            label: 'Inbox',
            tooltip: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: const Color.fromRGBO(34, 34, 34, 0.7),
        selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        iconSize: 32,
        selectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(34, 34, 34, 0.7),
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(34, 34, 34, 0.7),
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        showUnselectedLabels: true,
      ),
      body: pages[_currentIndex],
    );
  }
}
