

import 'dart:convert';

import 'package:ecommerce/data/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static late SharedPreferences sharedPreferences ;
  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  cachePosts(List<Product> products , key) {
    try{
      List postModelToJson = products.map<Map<String , dynamic>>((e) => e.toJson()).toList();
      sharedPreferences.setString(key, json.encode(postModelToJson));
    }catch (e){
      print(e);
    }
  }

  @override
  getCachedPosts(key) {
    final jsonString = sharedPreferences.getString(key);
    if(jsonString != null){
      List decodeJsonData = json.decode(jsonString);
      List<Product> jsonToPostsModel = decodeJsonData.map<Product>((e) => Product.fromJson(e)).toList();
      return jsonToPostsModel ;
    }
  }
}