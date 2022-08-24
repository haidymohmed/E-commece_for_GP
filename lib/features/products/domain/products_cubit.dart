
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/datasourse/product_api.dart';
import 'package:ecommerce/data/model/product.dart';
import 'package:ecommerce/features/products/domain/products_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayProductsCubit extends Cubit<ProductsStatus>{

  late  StreamSubscription<List<Product>> products;
  DisplayProductsCubit() : super(DisplayProductsLoading());
  ProductAPI productAPI = ProductAPI();
  bool descending = false ;
  static DisplayProductsCubit get(context) => BlocProvider.of(context);
  getBestSeller({required descending}) {
    try{
      products = productAPI.filterProducts(descending: descending).listen((event) {
      emit(DisplayProductsSuccessfully(products: event));
    });
    }on FirebaseException catch (e){
    emit(DisplayProductsFailed(error: e.message.toString()));
    }
  }

  getNewArrivals({required bool descending}) {
    try{
      products = productAPI.filterProductsByDate(descending: descending).listen((event) {
        emit(DisplayProductsSuccessfully( products: event));
      });
    }on FirebaseException catch (e){
      emit(DisplayProductsFailed(error: e.message.toString()));
    }
  }
}