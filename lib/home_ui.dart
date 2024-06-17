import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kinetic_kanvas/main.dart';

import 'package:kinetic_kanvas/views/others/profile_page.dart';
import 'package:kinetic_kanvas/views/screens/classes/class_description_page.dart';
import 'package:kinetic_kanvas/views/screens/home_page.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const ClassDescription(),
    const ProfilePage()
  ];

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      body: HomeUI._widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(5), left: Radius.circular(5)),
        child: GNav(
          gap: 8,
          padding: const EdgeInsets.all(18),
          color: Colors.white,
          activeColor: darkColor.lightPink,
          backgroundColor: const Color.fromARGB(255, 37, 37, 37),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
              textSize: 20,
            ),
            GButton(
              icon: Icons.class_,
              text: "Class",
              textSize: 20,
            ),
            GButton(
              textSize: 20,
              icon: Icons.person,
              text: "Profile",
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
