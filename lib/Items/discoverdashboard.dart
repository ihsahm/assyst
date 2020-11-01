import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:assyst/Screens/Pages/cardetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class DiscoverDashboard extends StatefulWidget {
  final String modelName;

  const DiscoverDashboard({Key key, this.modelName}) : super(key: key);

  @override
  _DiscoverDashboardState createState() => _DiscoverDashboardState();
}

class _DiscoverDashboardState extends State<DiscoverDashboard> {
  @override
  QuerySnapshot items;

  crudMethods crudObj = new crudMethods();

  @override
  void initState() {
    crudObj.getDataByModel(widget.modelName).then((results) {
      setState(() {
        items = results;
      });
    });
    super.initState();
  }

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
                                      "${items.docs[index].data()['image']}",
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
                                // backgroundColor: Colors.white24,
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
                      //cancelToken: cancellationToken,
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
