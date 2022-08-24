// ignore: file_names
import 'package:ecommerce/data/model/product.dart';
import 'package:flutter/cupertino.dart';

class CardTest extends ChangeNotifier{
  List<Product> products = [];
  int total = 0;
  addProduct(Product product){
    for(Product item in products){
      if(item.id == product.id){
        return true ;
      }
    }
    total += product.price ;
    products.add(product);
    notifyListeners();
  }
  deleteProduct(Product product){
    products.remove(product);
    total -= product.price ;
    notifyListeners();
  }
  containItem(String id){
    for(Product item in products){
      if(item.id == id){
        return true ;
      }
    }
    return false ;
  }
}