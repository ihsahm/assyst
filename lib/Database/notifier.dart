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

  Future<void> addData(itemData) async {
    var id = Uuid();
    String productId = id.v1();
    if (isLoggedIn()) {
      // ignore: unused_element
      void uploadProduct(
          {String productName,
          double price,
          String description,
          String negotiable,
          List images,
          String delivery}) {
        FirebaseFirestore.instance.collection(ref).doc(productId).set({
          'name': productName,
          'price': price,
          'description': description,
          'delivery': delivery,
          'negotiable': negotiable,
          'images': images.toString(),
        });
      }
    } else {
      print('You need to be logged');
    }
  }

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
