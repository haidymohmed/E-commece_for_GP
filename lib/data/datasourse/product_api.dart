import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/model/product.dart';

const String PRODUCTS = "products";
class ProductAPI{
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance ;

  getAllProducts(){
    return firebaseFireStore.collection(PRODUCTS).snapshots().map((event){
      List<Product> products = [];
      for (var element in event.docs) {
        var product = Product.fromJson(element.data());
        products.add(product);
      }
      return products ;
    });
  }
  getProductsByCategoryId(String id){
    return firebaseFireStore.collection(PRODUCTS).where("categoryId" , isEqualTo:  id.toString()).snapshots().map((event){
      List<Product> products = [];
      for (var element in event.docs) {
        var product = Product.fromJson(element.data());
        print(product.categoryId);
        products.add(product);
      }
      return products ;
    });
  }
  filterProducts({required bool descending}){
    return firebaseFireStore.collection(PRODUCTS).orderBy("price" , descending: descending).snapshots().map((event){
      List<Product> products = [];
      for (var element in event.docs) {
        var product = Product.fromJson(element.data());
        print(product.categoryId);
        products.add(product);
      }
      return products ;
    });
  }
  filterProductsByDate({required bool descending}){
    DateTime dateTime = DateTime.now().subtract(const Duration(days: 60));
    return firebaseFireStore.collection(PRODUCTS).where("date" , isGreaterThan: dateTime).snapshots().map((event){
      List<Product> products = [];
      event.docs.map((e){
        Product product = Product.fromJson(e.data());
        print(product.id);
        products.add(product);
      });
      return products;
    });
  }
  filterCategoryProducts({required String id , required bool descending}){
    return firebaseFireStore.collection(PRODUCTS).where("categoryId" , isEqualTo:  id.toString()).orderBy("price" , descending: descending).snapshots().map((event){
      List<Product> products = [];
      for (var element in event.docs) {
        var product = Product.fromJson(element.data());
        products.add(product);
      }
      return products ;
    });
  }
}