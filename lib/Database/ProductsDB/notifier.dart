import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';

// ignore: camel_case_types
class crudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  String ref = 'products';

  /*Future<List<crudMethods>> searchProducts({String productName}) {
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return FirebaseFirestore.instance
        .collection("itemslist")
        .orderBy("productName")
        .startAt([searchKey])
        .endAt([
          [searchKey + '\uf8fff']
        ])
        .get()
        .then((result) {
          List<crudMethods> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(crudMethods.fromSnapshot(products));
          }

        return products;
        });
  }*/

  getData() async {
    return await FirebaseFirestore.instance
        .collection('itemlist')
        .orderBy('productName')
        .get();
  }


  getDataByModel(String name) async {
    return await FirebaseFirestore.instance
        .collection('itemlist')
        .where("productName", isEqualTo: name)
        .get();
  }
}
