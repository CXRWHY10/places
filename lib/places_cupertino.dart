import 'package:flutter/material.dart';
import 'home.dart';
import 'search_places.dart';
import 'profile_places.dart';

class PlacesCupertino extends StatefulWidget {
  const PlacesCupertino({super.key});

  @override
  State<PlacesCupertino> createState() => _PlacesCupertinoState();
}

class _PlacesCupertinoState extends State<PlacesCupertino> {
  int _indexTap = 0;

  final List<Widget> _widgetsChildren = [
    Myhome(),
    SearchPlaces(),
    const ProfilePlaces(),
  ];

  void onTapTapped(int index) {
    setState(() {
      _indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetsChildren[_indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: _indexTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}