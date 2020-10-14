import 'package:assyst/Database/newuserdb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Database/notifier.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_picture;
  final product_detail_name;
  final product_detail_price;
  final product_detail_address;
  final product_detail_mileage;
  final product_detail_fuel;
  final product_detail_condition;
  final product_detail_year;
  final product_detail_number;
  final product_detail_description;
  final product_detail_transmission;
  final product_detail_negotiable;

  ProductDetails({
    this.product_detail_picture,
    this.product_detail_name,
    this.product_detail_price,
    this.product_detail_address,
    this.product_detail_transmission,
    this.product_detail_description,
    this.product_detail_negotiable,
    this.product_detail_fuel,
    this.product_detail_condition,
    this.product_detail_year,
    this.product_detail_mileage,
    this.product_detail_number,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String item;
  String transmission;
  QuerySnapshot items;
  List<Color> _colors = [
    Colors.grey,
    Colors.red,
  ];

  String _imageUrl;

  String get imageUrl => _imageUrl;

  int _currentIndex = 0;

  _onChanged() {
    /*int _colorCount = _colors.length;
    setState(() {
      if (_currentIndex == _colorCount - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex += 1;
      }
    });*/

    Fluttertoast.showToast(
        msg: 'Added to favorites',
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  QuerySnapshot users;
  int index;
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

  @override
  Widget build(BuildContext context) {
    if (items != null) {
      return MaterialApp(
        home: Scaffold(
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
          body: Stack(children: <Widget>[
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () => _ImagePage(context),
                  child: Hero(
                      tag: "Demo",
                      child: SizedBox(
                        height: 300,
                        child: ExtendedImage.network(
                          widget.product_detail_picture,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          cache: true,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          //cancelToken: cancellationToken,
                        ),
                      )),
                ),
                Divider(
                  thickness: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                        minWidth: 150.0,
                        height: 50.0,
                        child: FlatButton.icon(
                          onPressed: () => launch("tel:+251910873541"),
                          icon: Icon(
                            Icons.call,
                            color: Colors.green[500],
                          ),
                          label: Text('Call Seller'),
                        )),
                    ButtonTheme(
                        minWidth: 150.0,
                        height: 50.0,
                        buttonColor: Colors.blue,
                        child: FlatButton.icon(
                            onPressed: () => launch("https://t.me/ihs_ahm"),
                            icon: Icon(
                              Icons.message,
                              color: Colors.blue[500],
                            ),
                            label: Text('Message Seller'))),
                    // IconButton(icon: Icon(Icons.call), onPressed: (){}),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Car name: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_name,
                              style: TextStyle(color: Colors.black))),
                      /* ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Car name: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_poster,
                              style: TextStyle(color: Colors.black))),*/
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Price: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text("${widget.product_detail_price} \Br.",
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Phone Number: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_number,
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          leading: Text(
                            "Mileage: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                              "${widget.product_detail_mileage} \km.",
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          leading: Text(
                            "Year: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_year,
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Condition:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(widget.product_detail_condition,
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Transmission: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_transmission,
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Fuel type: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_fuel,
                              style: TextStyle(color: Colors.black))),
                      ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          leading: Text(
                            "Negotiable: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(widget.product_detail_negotiable,
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),
                ),
                Divider(
                  thickness: 10,
                ),
                SizedBox(height: 15),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(height: 20),
                Text(widget.product_detail_description),
                SizedBox(height: 15),
                Divider(
                  thickness: 10,
                ),
                SizedBox(height: 15),
                Text(
                  'Other items',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(),
                Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.only(top: 15),
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.docs.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1),
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
                                                    "${items.docs[index].data()['images']}",
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
                                    "${items.docs[index].data()['images']}",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: double.infinity,
                                    cache: true,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    //cancelToken: cancellationToken,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                SizedBox(height: 15),
                Divider(
                  thickness: 10,
                )
              ],
            )),
          ]),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 5,
            ),
            Text('Loading,Please wait...'),
          ],
        )),
      );
    }
  }

  void _ImagePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Hero(
              tag: "Demo",
              child: ExtendedImage.network(
                widget.product_detail_picture,
                width: double.infinity,
                cache: true,
                mode: ExtendedImageMode.gesture,
                initGestureConfigHandler: (state) {
                  return GestureConfig(
                    minScale: 1,
                    maxScale: 3.0,
                    speed: 1.0,
                    inertialSpeed: 100.0,
                    inPageView: false,
                    initialAlignment: InitialAlignment.center,
                  );
                },
              ),
            ),
          )),
    ));
  }
}