import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:assyst/Items/discoverdashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PopularCar extends StatefulWidget {
  final car_name;
  PopularCar({this.car_name});
  @override
  _PopularCarState createState() => _PopularCarState();
}

class _PopularCarState extends State<PopularCar> {
  QuerySnapshot items;

  crudMethods crudObj = new crudMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: DiscoverDashboard(
        modelName: widget.car_name,
      ),
      /*ListView(
        children: [
          Column(
            children: [
              Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.blueGrey[800],
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(widget.car_name,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('Starting from 250,000 Br.',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),*/
    );
  }
}
