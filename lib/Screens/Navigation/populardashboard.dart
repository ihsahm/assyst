import 'package:assyst/Items/discover.dart';
import 'package:flutter/material.dart';

class FavoriteItems extends StatefulWidget {
  @override
  _FavoriteItemsState createState() => _FavoriteItemsState();
}

class _FavoriteItemsState extends State<FavoriteItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: TextStyle(color: Colors.blue, fontSize: 21),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Container(), //new Discover()      
    );
  }
}
