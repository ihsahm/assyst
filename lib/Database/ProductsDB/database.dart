import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  Future updateUserData(
    String name,
    int price,
    String description,
    String category,
    String negotiable,
    String delivery,
  ) async {
    return await productCollection.doc(uid).set({
      "name": name,
      "price": price,
      "description": description,
      "category": category,
      "negotiable": negotiable,
      "delivery": delivery,
    });
  }

  Stream<QuerySnapshot> get products {
    return productCollection.snapshots();
  }
}
