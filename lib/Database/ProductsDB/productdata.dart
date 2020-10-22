import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'products';

  Future<void> uploadProduct(
      {String productName,
      double price,
      String description,
      String fuel,
      String year,
      List<String> indexList,
      String phoneNumber,
      String condition,
      String negotiable,
      List images,
      String transmission}) async {
        if(images==null){
          Text('Images Not available');
        }
        
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection(ref).doc(productId).set({
      'name': productName,      
      'searchIndex': indexList,
      'price': price,
      'description': description,
      'fuel': fuel,
      'condition': condition,
      'phoneNumber': phoneNumber,
      'year': year,
      'transmission': transmission,
      'negotiable': negotiable,
      'images': images
    });
  }
}
