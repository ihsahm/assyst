import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:assyst/Screens/Pages/cardetails.dart';
import 'package:assyst/Screens/Pages/populardealers.dart';
import 'package:assyst/Screens/Pages/popularpage.dart';
import 'package:assyst/Search/searchservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:algolia/algolia.dart';

class SearchDashboard extends StatefulWidget {
  @override
  _SearchDashboardState createState() => _SearchDashboardState();
}

class _SearchDashboardState extends State<SearchDashboard> {
  TextEditingController searchController = TextEditingController();
  var checkedValue1;
  var checkedValue2;
  var checkedValue3;
  var checkedValue4;
  var checkedValue5;
  var checkedValue6;

  Future<QuerySnapshot> futureSearchResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
            controller: searchController,
            onFieldSubmitted: controlSearching,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () => searchController.clear(),
              ),
              hintText: 'Search for a car...',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80))),
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1.0, 0.5),
                    blurRadius: 6.0,
                  )
                ]),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                futureSearchResults == null
                    ? displayNoSearchResult()
                    : displaySearchResults(),
              ],
            ),
          )
        ],
      ),
    );
  }

  controlSearching(String productname) {
    Future<QuerySnapshot> allFoundProducts = FirebaseFirestore.instance
        .collection('itemlist')
        .where('productName', isGreaterThanOrEqualTo: productname)
        .get();

    setState(() {
      futureSearchResults = allFoundProducts;
    });
  }

  displayNoSearchResult() {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child:
            ListView(shrinkWrap: true, children: <Widget>[Text('Search Cars')]),
      ),
    );
  }

  displaySearchResults() {
    return FutureBuilder(
        future: futureSearchResults,
        builder: (context, dataSnapshot) {
          if (dataSnapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<SearchResult> searchProductResult = [];
          dataSnapshot.data.documents.forEach((document) {
            // crudMethods eachProduct=crudMethods.fromDocuments(document);
          });
        });
  }
}

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
