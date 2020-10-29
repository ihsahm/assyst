import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carr {
  final String condition;
  final String description;
  final String fuel;
  final String image;
  final String mileage;
  final String negotiable;
  final String phoneNumber;
  final String price;
  final String productName;
  final String searchKey;
  final String transmission;
  final String year;

  Carr(
      {this.condition,
      this.description,
      this.fuel,
      this.image,
      this.mileage,
      this.negotiable,
      this.phoneNumber,
      this.price,
      this.productName,
      this.searchKey,
      this.transmission,
      this.year});
  factory Carr.fromDocument(DocumentSnapshot doc) {
    return Carr(
        condition: doc.data()['condition'],
        description: doc.data()['description'],
        fuel: doc.data()['fuel'],
        image: doc.data()['image'],
        mileage: doc.data()['mileage'],
        negotiable: doc.data()['negotiable'],
        phoneNumber: doc.data()['phoneNumber'],
        price: doc.data()['price'],
        productName: doc.data()['productName'],
        searchKey: doc.data()['searchKey'],
        transmission: doc.data()['transmission'],
        year: doc.data()['year']);
  }
}
