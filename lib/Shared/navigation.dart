import 'package:assyst/Screens/Navigation/dashboard.dart';
import 'package:assyst/Screens/Navigation/search.dart';
import 'package:assyst/Screens/Navigation/postscreen.dart';
import 'package:assyst/Screens/Navigation/settings.dart';
import 'package:assyst/Screens/Navigation/populardashboard.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _pages = <Widget>[
      Center(child: HomePage()),
      Center(child: Search()),
      Center(child: Post()),
      Center(child: FavoriteItems()),
      Center(child: Settings()),
    ];
    final _items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
      BottomNavigationBarItem(
          icon: Icon(Icons.add, color: Colors.pink[800]),
          title: Text(
            'Post a car',
            style: TextStyle(color: Colors.pink[800]),
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.car_rental), title: Text('Popular')),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text('Settings')),
    ];
    assert(_pages.length == _items.length);

    final bottomNavBar = BottomNavigationBar(
        items: _items,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
