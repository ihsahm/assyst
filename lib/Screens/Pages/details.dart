import 'package:assyst/Screens/Pages/cardetails.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {

  int _currentIndex = 0;
  List<Color> _colors = [
    Colors.grey,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Product Details',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: _colors[_currentIndex],
                ),
                onPressed: () {
                  int _colorCount = _colors.length;
                  setState(() {
                    if (_currentIndex == _colorCount - 1) {
                      _currentIndex = 0;
                    } else {
                      _currentIndex += 1;
                    }
                  });
                  /*items.addItem(
                    widget.product_detail_name
                  )*/
                  //Navigator.of(context).pushNamed(Favorites.routeName);
                  // Fluttertoast.showToast(msg: "${widget.product_detail_name} added to favorites",backgroundColor: Colors.black,textColor: Colors.white);
                },
              ),
            ],
            centerTitle: true,
            leading: IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: ProductDetails(),
          );
  }
}