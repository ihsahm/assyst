import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'products';

  void uploadProduct(
      {String productName,
      double price,
      String description,
      String fuel,
      String year,
      String phoneNumber,
      String condition,
      String negotiable,
      List images,
      String transmission}) {
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection(ref).doc(productId).set({
      'name': productName,
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
