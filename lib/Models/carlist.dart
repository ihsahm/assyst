import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const NAME = "productName";
  static const PRICE = "price";
  static const PHONE = "phoneNumber";
  static const IMAGE = "images";
  static const MILEAGE = "price";
  static const YEAR = "year";
  static const CONDITION = "condition";
  static const DESCRIPTION = "description";
  static const TRANSMISSION = "transmission";
  static const FUELTYPE = "fuel";
  static const NEGOTIABLE = "negotiable";

  String _name;
  String _price;
  String _phone;
  String _image;
  String _mileage;
  String _year;
  String _transmission;
  String _condition;
  String _description;
  String _fueltype;
  String _negotiable;

  String get name => _name;
  String get price => _price;
  String get phone => _phone;
  String get mileage => _mileage;
  String get year => _year;
  String get description => _description;
  String get image => _image;
  String get transmission => _transmission;
  String get condition => _condition;
  String get fueltype => _fueltype;
  String get negotiable => _negotiable;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
    _price = snapshot.data()[PRICE];
    _phone = snapshot.data()[PHONE];
    _transmission=snapshot.data()[TRANSMISSION];
    _description = snapshot.data()[DESCRIPTION];
    _year = snapshot.data()[YEAR];
    _mileage = snapshot.data()[MILEAGE];
    _condition = snapshot.data()[CONDITION];
    _fueltype = snapshot.data()[FUELTYPE];
    _negotiable = snapshot.data()[NEGOTIABLE];
  }
}
