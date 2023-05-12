import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/screens/homepage1_screen.dart';
import 'package:flutter_travel_app/representation/screens/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routerName = "homepage_screen";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children:  [
          const HomePage1(),
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index)
        {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colorpalette.buttonColor,
        unselectedItemColor: Colors.black,
        margin: const EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: kDefaultIconSize,
            ),
            title: const Text("Home"),
          ),
           SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidBell,
              size: kDefaultIconSize,
            ),
            title: const Text("Notifications"),
          ),
           SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.briefcase,
              size: kDefaultIconSize,
            ),
            title: const Text("Booking"),
          ),
           SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultIconSize,
            ),
            title: const Text("Account"),
          ),
        ],
      ),
    );
  }
}
