
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/datasourse/product_api.dart';
import 'package:ecommerce/data/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'category_products_status.dart';

class CategoryScreenUseCase extends Cubit<CategoriesScreenState> {

  late  StreamSubscription<List<Product>> subscription;
  ProductAPI productAPI = ProductAPI();
  bool descending = false;
  static CategoryScreenUseCase get(context) => BlocProvider.of(context);
  CategoryScreenUseCase() : super(ProductsCategoryFilterLoading());
  filterProductWithHighPrice({required String id}){
    try{
      subscription = productAPI.filterCategoryProducts(descending: true , id: id).listen((event) {
        descending = true ;
        emit(ProductsCategoryFilterSuccessfully(products: event));
      });
    }on FirebaseException catch (e){
      emit(ProductsCategoryFilterFailed(error: e.message.toString()));
    }
  }
  filterProductWithLowestPrice({required String id}){
    try{
      subscription = productAPI.filterCategoryProducts(descending: false, id: id).listen((event) {
        descending = false ;
        emit(ProductsCategoryFilterSuccessfully(products: event));
      });
    }on FirebaseException catch (e){
      emit(ProductsCategoryFilterFailed(error: e.message.toString()));
    }
  }
}