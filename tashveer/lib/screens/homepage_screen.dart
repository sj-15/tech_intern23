import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tashveer/widgets/profile_page.dart';

import '../widgets/favourites_page.dart';
import '../widgets/photos_page.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      BuildPhotosScreen(),
      buildFavoritesScreen(),
      const BuildProfileScreen()
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'tashveer',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white54,
        unselectedLabelStyle: const TextStyle(color: Colors.white54),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.photo)
                : const Icon(Icons.photo_outlined),
            label: _selectedIndex == 0 ? 'Photos' : '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
            label: _selectedIndex == 1 ? 'Favourites' : '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: _selectedIndex == 2 ? 'Profile' : '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
