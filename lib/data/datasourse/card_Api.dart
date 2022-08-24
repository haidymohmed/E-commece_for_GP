
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/model/product.dart';

class CardApi {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance ;

  addToCard(Product product ){
    firebaseFirestore.collection("cards").doc(product.id).set(product.toJson());
  }
  deleteFromCard(Product product ){
    firebaseFirestore.collection("cards").doc(product.id).delete();
  }
  placeOrder(Product product ){
    firebaseFirestore.collection("orders").doc(product.id).set(product.toJson()).then((value){
      deleteFromCard(product).catchError((e){
        deleteFromCard(product).catchError((e){
        });
      });
    });
  }
  getCard(){
    return firebaseFirestore.collection("products").snapshots().map((event){
      List<Product> products = [];
      event.docs.map((e) {
        Product product = Product.fromJson(e.data());
        products.add(product);
      });
      return products ;
    });
  }
}