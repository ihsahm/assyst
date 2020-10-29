// import 'dart:html';

import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:assyst/Models/carr.dart';
import 'package:assyst/Screens/Pages/cardetails.dart';
import 'package:assyst/Screens/Pages/populardealers.dart';
import 'package:assyst/Screens/Pages/popularpage.dart';
import 'package:assyst/Search/searchservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

final usersRef = Firestore.instance.collection('itemlist');

class SearchDashboard extends StatefulWidget {
  @override
  _SearchDashboardState createState() => _SearchDashboardState();
}

class _SearchDashboardState extends State<SearchDashboard> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot> searchResultsFuture;

  handleSearch(String query) {
    String query2 = query.toString().toUpperCase();
    Future<QuerySnapshot> users = usersRef
        .where('productName', isGreaterThanOrEqualTo: query2)
        .getDocuments();
    setState(() {
      searchResultsFuture = users;
    });
  }

  clearSearch() {
    searchController.clear();
  }

  AppBar builSearchField() {
    return AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              hintText: 'Search for a car...',
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                size: 28.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearSearch,
              )),
          onFieldSubmitted: handleSearch,
        ));
  }

  Container buildNoContent() {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
        child: Center(
            child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Image.asset('assets/findcar.png',
            height: orientation == Orientation.portrait ? 300.0 : 200),
        Text(
          'Find a car',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
        )
      ],
    )));
  }

  buildSearchResults() {
    return FutureBuilder(
      future: searchResultsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return ListView(
            children: [],
          );
        }
        List<CarResult> searchResults = [];
        snapshot.data.documents.forEach((doc) {
          Carr carr = Carr.fromDocument(doc);
          CarResult searchResult = CarResult(carr);
          searchResults.add(searchResult);
        });
        return ListView(
          children: searchResults,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blue.shade300,
        appBar: builSearchField(),
        body: searchResultsFuture == null
            ? buildNoContent()
            : buildSearchResults());
  }
}

class CarResult extends StatelessWidget {
  final Carr carr;
  CarResult(this.carr);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[800],
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              String cc = carr.phoneNumber;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                        product_detail_name: carr.productName,
                        product_detail_description: carr.description,
                        product_detail_number: carr.phoneNumber,
                        product_detail_price: carr.price,
                        product_detail_mileage: carr.mileage,
                        product_detail_picture: carr.image,
                        product_detail_address: "",
                        product_detail_negotiable: carr.negotiable,
                        product_detail_transmission: carr.transmission,
                        product_detail_fuel: carr.fuel,
                        product_detail_year: carr.year,
                        product_detail_condition: carr.condition),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(-2, -1),
                        blurRadius: 5),
                  ]),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      child: Image.network(
                        carr.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              //   padding: const EdgeInsets.all(8.0),
                              child: Text(
                                carr.productName,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                "${carr.price} \Br",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          /*ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(carr.image),
              ),
              title: Text(carr.productName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text("${carr.price} Br.", style: TextStyle(color: Colors.white)),
            ),*/

          Divider(
            height: 2.0,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}

//   controlSearching(String productname) {
//     Future<QuerySnapshot> allFoundProducts = FirebaseFirestore.instance
//         .collection('itemlist')
//         .where('productName', isEqualTo: productname)
//         .get();

//     setState(() {
//       futureSearchResults = allFoundProducts;
//     });
//   }

//   displayNoSearchResult() {
//     final Orientation orientation = MediaQuery.of(context).orientation;
//     return Container(
//       child: Center(
//         child:
//             ListView(shrinkWrap: true, children: <Widget>[Text('Search Cars')]),
//       ),
//     );
//   }

//   displaySearchResults() {
//     return FutureBuilder(
//         future: futureSearchResults,
//         builder: (context, dataSnapshot) {
//           if (dataSnapshot.hasData) {
//             return CircularProgressIndicator();
//           }
//           List<SearchResult> searchProductResult = [];
//           dataSnapshot.data.documents.forEach((document) {
//              // crudMethods eachProduct=crudMethods.fromDocuments(document);
//           });
//         });
//   }
// }

// class SearchResult extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
