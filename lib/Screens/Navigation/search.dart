import 'package:algolia/algolia.dart';
import 'package:assyst/Items/searchdashboard.dart';
import 'package:assyst/Search/algolia.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Algolia _algoliaApp = AlgoliaApp.algolia;
  String _searchTerm;
  
  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("itemlist").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Search',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: SearchDashboard());
  }
}
