import 'package:assyst/Items/dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: Icon(
          Icons.directions_car,
          color: Colors.blue,
        ),
        elevation: 0,
        backgroundColor: Colors.white12,
        title: Text(
          'Assyst',
          style: TextStyle(color: Colors.blue, fontSize: 21),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                // showSearch(context: context, delegate: ProductSearch());
              }),
        ],
        automaticallyImplyLeading: false,
      ),
      body: All(),
    );
  }
}

/*class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}*/
