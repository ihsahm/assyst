import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class UserRegister {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'products';

  void uploadProduct({
    String userName,
    String phone,
  }) {
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection(ref).doc(productId).set({
      'name': userName,
      'price': phone,
    });
  }

  getuserData() async {
    return await FirebaseFirestore.instance.collection('userlist').get();
  }
}
