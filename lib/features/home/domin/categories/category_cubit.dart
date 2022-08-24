
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/datasourse/category_api.dart';
import 'package:ecommerce/data/model/category.dart';

import 'category_status.dart';
class GetCategoriesCubit extends Cubit<CategoriesState> {
  late  StreamSubscription<List<Category>> subscription;
  CategoryAPI categoryAPI = CategoryAPI();
  GetCategoriesCubit() : super(GetCategoriesLoading()){
    try{
      subscription = categoryAPI.getCategories().listen((event) {
        print(event.length);
        print(event[0].name);
        emit(GetCategoriesSuccessfully(categories: event));
      });
    }on FirebaseException catch (e){
      emit(GetCategoriesFailed(error: e.message.toString()));
    }
  }

  @override
  Future<void> close() async{
    await subscription.cancel();
    return super.close();
  }
}