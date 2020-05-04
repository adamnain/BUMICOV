import 'package:bumicov/src/pages/help/help_page.dart';
import 'package:bumicov/src/pages/home/home_page.dart';
import 'package:bumicov/src/pages/news/news_page.dart';
import 'package:bumicov/src/utils/values/colors.dart';
import 'package:flutter/material.dart';
import 'maps/maps_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final _layoutPage = [
    HomePage(),
    MapsPage(),
    NewsPage(),
    HelpPage(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Dashboard')),
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Map')),
          BottomNavigationBarItem(
              icon: Icon(Icons.forum), title: Text('Berita')),
          BottomNavigationBarItem(
              icon: Icon(Icons.call), title: Text('Keluhan')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
