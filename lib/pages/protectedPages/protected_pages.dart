import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/protectedPages/add_listing.dart';
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
    AddListing(),
    Inbox(),
    Profile(),
  ];

  String userType = "agent";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Home',
            tooltip: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.save),
            activeIcon: Icon(Icons.save_outlined),
            label: 'Saved',
            tooltip: 'Saved',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            activeIcon: Icon(Icons.explore_outlined),
            label: 'Explore',
            tooltip: 'Explore',
          ),
          if (userType == 'agent')
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              activeIcon: Icon(Icons.add_box_outlined),
              label: 'Add Listing',
              tooltip: 'Add Listing',
            ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.inbox_rounded),
            activeIcon: Icon(Icons.inbox_outlined),
            label: 'Inbox',
            tooltip: 'Inbox',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            activeIcon: Icon(Icons.person_outlined),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        unselectedItemColor: _currentIndex == 0 ? Colors.white : Colors.black,
        unselectedLabelStyle: TextStyle(
          color: _currentIndex == 0
              ? Colors.white
              : Theme.of(context).colorScheme.inversePrimary,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        selectedLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        iconSize: 32,
        showUnselectedLabels: true,
        // type property must be BottomNavigationBarType.fixed to enable changing background color
        type: BottomNavigationBarType.fixed,
        backgroundColor: _currentIndex == 0 ? Colors.black : Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
    );
  }
}
