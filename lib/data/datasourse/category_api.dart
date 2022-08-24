
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/model/category.dart';
// ignore: constant_identifier_names
const String CATEGORIES = "categories";
class CategoryAPI {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance ;

  getCategories(){
    return firebaseFireStore.collection(CATEGORIES).snapshots().map((event){
      List<Category> categories = [];
      for (var element in event.docs) {
        var category = Category.fromJson(element.data());
        print(category.name);
        categories.add(category);
      }
      return categories ;
    });
  }
}