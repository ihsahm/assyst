import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductList{
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  void createProduct(String name){
    var id=Uuid();
    String categoryId=id.v1();
    _firestore.collection('productName').doc(categoryId).set({'product':name});
  }



}