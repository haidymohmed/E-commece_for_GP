// ignore: file_names
import 'package:ecommerce/data/model/product.dart';
import 'package:flutter/cupertino.dart';

class OrderTest extends ChangeNotifier{
  List<Product> products = [];
  addProduct(Product product){
    for(Product item in products){
      if(item.id == product.id){
        return true ;
      }
    }
    products.add(product);
    notifyListeners();
  }
  deleteProduct(Product product){
    products.remove(product);
    notifyListeners();
  }
}