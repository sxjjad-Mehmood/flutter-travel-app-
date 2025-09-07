import 'package:airbnbproject/views/explorescreen.dart';
import 'package:airbnbproject/views/messagescreen.dart';
import 'package:airbnbproject/views/profilescreen.dart';
import 'package:airbnbproject/views/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int selctedindex = 0;
  final List<Widget> screens = [
    Explorescreen(),
    Wishlist(),
    Scaffold(),
    messagescreen(),
    Profilescreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          iconSize: 32,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black45,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: false,
          currentIndex: selctedindex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              selctedindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: selctedindex == 0 ? Colors.pink : Colors.black45,
                ),
                label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: selctedindex == 1 ? Colors.pink : Colors.black45,
                ),
                label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.airbnb,
                  color: selctedindex == 2 ? Colors.pink : Colors.black45,
                ),
                label: "Trip"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notification_add,
                  color: selctedindex == 3 ? Colors.pink : Colors.black45,
                ),
                label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: selctedindex == 4 ? Colors.pink : Colors.black45,
                ),
                label: "profile"),
          ]),
      body: screens.elementAt(selctedindex),
    );
  }
}
