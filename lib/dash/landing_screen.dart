import 'package:flutter/material.dart';
import 'package:notesapp/dash/pages/HomeScreem.dart';
import 'package:notesapp/dash/pages/NotesScreen.dart';
import 'package:notesapp/dash/pages/ProfileScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const NotesScreen(),
    //todo #0 Make profile page and call here
     const ProfileScreen(),
  ];

  int _selectedItemIndex = 0;

  void onBottomNavItemSelected(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedItemIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        onTap: onBottomNavItemSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
