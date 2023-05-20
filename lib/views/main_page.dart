import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:tales_of_tourists/views/leaderboard.dart';
import 'package:tales_of_tourists/views/quest_selection.dart';
import 'package:tales_of_tourists/views/user_profile_view.dart';

/*
  As for the frontend part of this file, I got my knowledge from 
    - https://youtu.be/TrXU0Q5-jMs
*/

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key:key);

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {

  // Main index which is for quest selection
  var _selectedIndex = 1;

  // List of the three pages for the navigation bar
  final List<Widget> list = [
    const UserProfileView(),
    const TOTHomeView(),
    const LeaderboardView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* 
        Creates a animated navigation bar of three items being "User Profile, Quests, Leaderboard" 
        with icons and text.
      */
      bottomNavigationBar: FlashyTabBar(
        height: 60,
        backgroundColor: Colors.black,
        animationCurve: Curves.linear,
        showElevation: true,
        items: [
          FlashyTabBarItem(
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.white,
            icon: const Icon(Icons.person_2), 
            title: const Text('User Profile'),
          ),
          FlashyTabBarItem(
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.white,
            icon: const Icon(Icons.gamepad), 
            title: const Text('Quests'),
          ),
          FlashyTabBarItem(
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.white,
            icon: const Icon(Icons.leaderboard), 
            title: const Text('Leaderboard'),
          )
        ],
        // Upon selected icon, it goes to the screen at the selected index from the list of pages.
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      body: list.elementAt(_selectedIndex),
    );
  }
}
