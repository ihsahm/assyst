import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  getData() async {
    return await FirebaseFirestore.instance.collection('itemlist').get();
  }

  getDataByModel(String name) async {
    return await FirebaseFirestore.instance
        .collection('itemlist')
        .where("productName", isEqualTo: name)
        .get();
  }
}
