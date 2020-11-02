import 'package:assyst/Database/UserDB/newuserdb.dart';
import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:assyst/Screens/Pages/cardetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  final product_detail_picture;
  final product_detail_name;
  final product_detail_number;
  final product_detail_price;
  final product_detail_address;
  final product_detail_fuel;
  final product_detail_mileage;
  final product_detail_condition;
  final product_detail_year;
  final product_detail_transmission;
  final product_detail_negotiable;
  final product_detail_description;

  All({
    this.product_detail_picture,
    this.product_detail_name,
    this.product_detail_price,
    this.product_detail_address,
    this.product_detail_transmission,
    this.product_detail_negotiable,
    this.product_detail_description,
    this.product_detail_fuel,
    this.product_detail_condition,
    this.product_detail_year,
    this.product_detail_mileage,
    this.product_detail_number,
  });

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  QuerySnapshot items;
  QuerySnapshot users;

  crudMethods crudObj = new crudMethods();
  UserRegister userData = new UserRegister();

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        items = results;
      });
    });
    super.initState();

    userData.getuserData().then((results) {
      setState(() {
        users = results;
      });
    });
    super.initState();
  }

  List<NetworkImage> _listOfImages = <NetworkImage>[];

  @override
  Widget build(BuildContext context) {
    if (items != null) {
      return GridView.builder(
          itemCount: items.docs.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  /*  product_detail_name:
                                      "${items.docs[index].data()['Description']}",
                                  product_detail_picture:
                                      "${items.docs[index].data()['image']}",*/
                                  product_detail_name:
                                      "${items.docs[index].data()['productName']}",
                                  product_detail_description:
                                      "${items.docs[index].data()['description']}",
                                  product_detail_number:
                                      "${items.docs[index].data()['phoneNumber']}",
                                  product_detail_price:
                                      "${items.docs[index].data()['price']}",
                                  product_detail_mileage:
                                      "${items.docs[index].data()['mileage']}",
                                  product_detail_picture:
                                      "${items.docs[index].data()['urls']}",
                                  product_detail_address:
                                      "${items.docs[index].data()['location']}",
                                  product_detail_negotiable:
                                      "${items.docs[index].data()['negotiable']}",
                                  product_detail_transmission:
                                      "${items.docs[index].data()['transmission']}",
                                  product_detail_fuel:
                                      "${items.docs[index].data()['fuel']}",
                                  product_detail_year:
                                      "${items.docs[index].data()['year']}",
                                  product_detail_condition:
                                      "${items.docs[index].data()['condition']},",
                                )));
                  },
                  child: GridTile(
                    footer: Container(
                      color: Colors.white70,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 2),
                          Text(
                            "${items.docs[index].data()['productName']}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            " ${items.docs[index].data()['price']} \Br.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    child: ExtendedImage.network(
                      "${items.docs[index].data()['image']}",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      cache: true,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 5,
          ),
          Text('Loading,Please wait...'),
        ],
      ));
    }
  }
}
