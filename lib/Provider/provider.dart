
import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:assyst/Models/carlist.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{
  crudMethods _productServices = crudMethods();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurant = [];
  List<ProductModel> productsSearched = [];


 /* Future search({String productName})async{
    productsSearched = await _productServices.searchProducts(productName: productName);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${productsSearched.length}");

    notifyListeners();
  }*/


}