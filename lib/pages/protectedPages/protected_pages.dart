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
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: _currentIndex == 0
            ? Colors.white
            : const Color.fromRGBO(34, 34, 34, 0.7),
        unselectedLabelStyle: TextStyle(
          color: _currentIndex == 0
              ? Colors.white
              : const Color.fromRGBO(34, 34, 34, 0.7),
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: _currentIndex == 0
            ? Theme.of(context).colorScheme.inversePrimary
            : Colors.black,
        selectedLabelStyle: TextStyle(
          color: _currentIndex == 0
              ? Theme.of(context).colorScheme.inversePrimary
              : Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        iconSize: 32,
        showUnselectedLabels: true,
        // removing type property disables changing background color
        type: BottomNavigationBarType.fixed,
        backgroundColor: _currentIndex == 0 ? Colors.black : Colors.white,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
    );
  }
}
