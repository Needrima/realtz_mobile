import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/bottomNavPages/add_listing.dart';
import 'package:realtz_mobile/pages/bottomNavPages/explore.dart';
import 'package:realtz_mobile/pages/bottomNavPages/home.dart';
import 'package:realtz_mobile/pages/bottomNavPages/inbox.dart';
import 'package:realtz_mobile/pages/bottomNavPages/profile.dart';
import 'package:realtz_mobile/pages/bottomNavPages/saved.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';

class BottomNavPages extends StatefulWidget {
  const BottomNavPages({super.key});

  @override
  State<BottomNavPages> createState() => _BottomNavPagesState();
}

class _BottomNavPagesState extends State<BottomNavPages> {
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
    return RedirectToLogin(
      child: Scaffold(
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
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(Icons.inbox_rounded),
                  Positioned(
                    top: -4,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              activeIcon: Stack(
                children: [
                  const Icon(Icons.inbox_outlined),
                  Positioned(
                    top: -4,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
      ),
    );
  }
}
